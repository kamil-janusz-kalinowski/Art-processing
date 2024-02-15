clc; clear; close all;
addAllPaths()

%% Quantization
name_file = 'cup_1.png';
img_origin = imread(name_file); 
img_processed = preprocessGrayImage(img_origin);
img_processed = double(img_processed)/255;

size_segment = [11, 11];
seg_boxes = calcSegmentsOfMat(size(img_processed), size_segment);

gen_circle_raster = @(img_part) generateQuantization(img_part);
img_rastered = rasterizationImg(img_processed, seg_boxes, gen_circle_raster);

figure()
imshow(img_rastered,[]);
title('Quantization')


%% Circles
name_file = 'cup_1.png';
img_origin = imread(name_file); 
img_processed = preprocessGrayImage(img_origin);
img_processed = double(img_processed)/255;

size_segment = [5, 11];
seg_boxes = calcSegmentsOfMat(size(img_processed), size_segment);

gen_circle_raster = @(img_part) generateEllipse(img_part,[0.05,1]);
img_rastered = rasterizationImg(img_processed, seg_boxes, gen_circle_raster);

figure()
imshow(img_rastered,[]);
title('Circles')

%%  Diamond

name_file = 'cup_1.png';
img_origin = imread(name_file); 
img_processed = preprocessGrayImage(img_origin);
img_processed = double(img_processed)/255;

size_segment = [11, 11];
seg_boxes = calcSegmentsOfMat(size(img_processed), size_segment);

gen_circle_raster = @(img_part) generateDiamond(img_part, [0.05,1]);
img_rastered = rasterizationImg(img_processed, seg_boxes, gen_circle_raster);

figure()
imshow(img_rastered,[]);
title('Diamond')


function addAllPaths()
    shared_resources_path = fullfile('..', '..', '..', 'Shared resources');
    
    addpath(genpath(shared_resources_path));
    addpath(genpath(pwd));
end