clc; clear; close all;
addAllPaths()
dbstop if error

%% Paint image based on values
color_map = crameri('romaO');

img_origin = imread('cup_1.png');
img_gray = preprocessGrayImage(img_origin);
img_gray = uint8(255*img_gray);

mask = img_gray >= 21;

color_img = colorizeImage(img_gray, mask, color_map);

% Wyświetlenie obrazów
figure()
subplot(1, 2, 1), imshow(img_gray,[]), title('Obraz szary');
subplot(1, 2, 2), imshow(color_img,[]), title('Kolorowany obraz');


%% Evolution over time

% Create image data
img_name = 'cup_1.png';
img_origin = imread(img_name);
img_gray = preprocessGrayImage(img_origin);
img_gray = uint8(255*img_gray);

mask = img_gray >= 21;

color_map = crameri('romaO');

data_img = createDataImgAnimation(img_gray, mask, color_map);

% Create gif data
name_save_file = 'test2.gif'; 
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