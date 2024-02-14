clc; clear; close all;
addAllPaths()

%% Paint image based on values
colorMap = crameri('romaO');

imgOrigin = imread('kwiat2.bmp');
imgGray = preprocessGrayImage(imgOrigin);

mask = imgGray ~=0;

colorImage = colorizeImage(imgGray, mask, colorMap);

% Wyświetlenie obrazów
figure()
subplot(1, 2, 1), imshow(imgGray,[]), title('Obraz szary');
subplot(1, 2, 2), imshow(colorImage,[]), title('Kolorowany obraz');



%% Evolution over time

% Create image data
img_name = 'Picture3.png';
imgOrigin = imread(img_name);
grayImage = preprocessGrayImage(imgOrigin);

mask = grayImage ~= 0;

colorMap = crameri('romaO');

data_img = createDataImgAnimation(grayImage, mask, colorMap);

% Create gif data
outputFileName = 'test.gif'; 
shift_speed = 6;
time_of_animation = 1; % Seconds

data_gif = createDataGifAnimation(outputFileName, shift_speed, time_of_animation);

% Create animation gif file

grayImageToAnimation(data_img, data_gif);




function addAllPaths()
    shared_resources_path = fullfile('..', 'Shared resources');
    
    addpath(genpath(shared_resources_path));
    addpath(genpath(pwd));
end