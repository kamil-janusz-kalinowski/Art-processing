clc; clear; close all;
add_all_paths()

img_name = 'kwiat2.bmp';
img_origin = imread(img_name);
grayImage = preprocessGrayImage(img_origin);

sigma = 1;
gauss_range = sigma * 6 + 1;

figure
imshow(grayImage,[]);
title('Original image')

img_transformed = transform_image(grayImage, gauss_range, sigma);

figure
imshow(uint8(img_transformed))
title('Image transformed')


function add_all_paths()
    scripts_path = fullfile('..', 'Scripts');
    materials_path = fullfile('..', 'Materials');
    
    addpath(genpath(scripts_path));
    addpath(genpath(materials_path));
    addpath(genpath(pwd));
end