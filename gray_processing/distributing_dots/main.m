clc; clear; close all;
addAllPaths()

name_file = 'cup_1.png';
img_origin = imread(name_file); 
img_processed = preprocessGrayImage(img_origin);
img_processed = imadjust(img_processed, [0.2, 1]).^2;

radius_circle = 2;
num_of_circles = 400;

img_final = zeros(size(img_processed));
img_probabilty = img_processed;
img_probabilty = addZeroMargin(img_probabilty, radius_circle);

[img_final, img_probabilty] = addRandomCircleToImg(img_final, img_probabilty, radius_circle, num_of_circles);

figure
subplot(1,2,1)
imshow(img_processed, [] )
title('Image original')

subplot(1,2,2)
imshow(img_final, [])
title('Image final')

function img = cutOffCircle(img, posXY, radius_circle)
    img_size = size(img);
    [xx_range, yy_range] = calcRangeAroundCenter(posXY, radius_circle);
    [xx_range, is_x_valid] = correctRange(xx_range, [1,img_size(2)]);
    [yy_range, is_y_valid] = correctRange(yy_range, [1,img_size(1)]);

    img_part = img(yy_range, xx_range);

    img_circle = drawEllipse([1,1]*(2*radius_circle+1), 1);
    mask = img_circle == 0;
    mask_croped = mask(is_y_valid, is_x_valid);
    img_part = img_part.*mask_croped;
    
    img(yy_range, xx_range) = img_part;
end

function [range_inds_corrected, mask] = correctRange(range_inds, borders)
    is_too_low = range_inds < borders(1);
    is_too_high = range_inds > borders(2);
    
    mask = ~(is_too_low | is_too_high);

    range_inds_corrected = range_inds(mask);
end

function [img, img_probabilty] = addRandomCircleToImg(img, img_probabilty, radius_circle, num_of_circles)
    img_size = size(img_probabilty);
    inds = 1 : length(img_probabilty(:));

    for ii = 1 : num_of_circles
        if find(img_probabilty) ~= 0
            ind_rand = randValueWithWeight(inds, img_probabilty(:)', 1);
            [yy, xx] = ind2sub(img_size, ind_rand);
            pos = [xx, yy];
        
            img = addCircleToImg(img, pos, radius_circle);
            
            img_probabilty = cutOffCircle(img_probabilty, pos, radius_circle*2);
        end
    end
end

function addAllPaths()
    shared_resources_path = fullfile('..', '..', 'Shared resources');
    
    addpath(genpath(shared_resources_path));
    addpath(genpath(pwd));
end