clc; clear; close all;
addAllPaths()

%% Paint image based on values
color_map = crameri('romaO');

img_origin = imread('kwiat2.bmp');
img_gray = preprocessGrayImage(img_origin);

mask = img_gray ~=0;

color_img = colorizeImage(img_gray, mask, color_map);

% Wyświetlenie obrazów
figure()
subplot(1, 2, 1), imshow(img_gray,[]), title('Obraz szary');
subplot(1, 2, 2), imshow(color_img,[]), title('Kolorowany obraz');


%% Evolution over time

% Create image data
img_name = 'Picture3.png';
img_origin = imread(img_name);
gray_image = preprocessGrayImage(img_origin);

mask = gray_image ~= 0;

color_map = crameri('romaO');

data_img = createDataImgAnimation(gray_image, mask, color_map);

% Create gif data
name_save_file = 'test.gif'; 
shift_speed = 6;
time_of_animation = 1; % Seconds

data_gif = createDataGifAnimation(name_save_file, shift_speed, time_of_animation);

% Create animation gif file

grayImageToAnimation(data_img, data_gif);




function addAllPaths()
    shared_resources_path = fullfile('..', 'Shared resources');
    
    addpath(genpath(shared_resources_path));
    addpath(genpath(pwd));
end