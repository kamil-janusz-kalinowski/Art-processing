clc; clear; close all;
addAllPaths()

name_file = 'cup_1.png';
img_origin = imread(name_file); 
img_processed = preprocessGrayImage(img_origin);

%Quant
size_segment = [11, 11];
seg_boxes = calcSegmentsOfMat(size(img_processed), size_segment);
gen_quant_raster = @(img_part) generateQuantization(img_part);
img_quant = rasterizationImg(img_processed, seg_boxes, gen_quant_raster);

%Circle
size_segment = [5, 11];
seg_boxes = calcSegmentsOfMat(size(img_processed), size_segment);
gen_circle_raster = @(img_part) generateEllipse(img_part,[0.05,1]);
img_circle = rasterizationImg(img_processed, seg_boxes, gen_circle_raster);

%Diamond
size_segment = [11, 11];
seg_boxes = calcSegmentsOfMat(size(img_processed), size_segment);
gen_diamond_raster = @(img_part) generateDiamond(img_part, [0.05,1]);
img_diament = rasterizationImg(img_processed, seg_boxes, gen_diamond_raster);

%Display
figure()
subplot(2,2,1);
imshow(img_processed ,[]);
title('Original')

subplot(2,2,2);
imshow(img_quant ,[]);
title('Quantization')

subplot(2,2,3);
imshow(img_circle ,[]);
title('Circles')

subplot(2,2,4);
imshow(img_diament ,[]);
title('Diamonds')

function addAllPaths()
    shared_resources_path = fullfile('..', '..', '..', 'Shared resources');
    
    addpath(genpath(shared_resources_path));
    addpath(genpath(pwd));
end