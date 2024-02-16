clc; clear; close all;
addAllPaths()
dbstop if error

%% Horizontal blur
img_name = 'cup_1.png';
img_origin = imread(img_name);
grayImage = preprocessGrayImage(img_origin);

sigma = 5;
gauss_range = sigma * 6 + 1;
layers_memory = 4;

mask = imgaussfilt(grayImage) >= 20;

img_transformed = transform_image(grayImage, gauss_range, sigma, mask);

figure
subplot(1,2,1)
imshow(grayImage,[]);
title('Original image')
subplot(1,2,2)
imshow(img_transformed, [])
title('Image transformed')

% %%
% 
% [gx, gy] = imgradient(grayImage);
% [x_size, y_size] = size(grayImage);
% 
% % Tworzenie losowych danych dla pola wektorowego
% [x, y] = meshgrid(linspace(-10,10,y_size), linspace(-10,10,x_size));
% 
% % Rysowanie pola wektorowego
% figure;
% quiver(x, y, gx, gy);
% xlabel('Oś X');
% ylabel('Oś Y');
% title('Pole Wektorowe');
% 
% %%
% 
% % Wczytanie obrazu
% grayImage = imread('cup_1.png');
% grayImage = preprocessGrayImage(grayImage);
% % Obliczenie gradientu obrazu
% [gx, gy] = imgradient(grayImage);
% [x_size, y_size] = size(grayImage);
% 
% % Tworzenie losowych danych dla pola wektorowego
% [x, y] = meshgrid(linspace(-10, 10, y_size), linspace(-10, 10, x_size));
% 
% % Przekształcanie obrazu na podstawie pola wektorowego
% transformedImage = interp2(double(grayImage), x+gx, y+gy, 'linear', 0);
% 
% % Wyświetlenie oryginalnego i przekształconego obrazu
% figure;
% subplot(1, 2, 1);
% imshow(grayImage,[]);
% title('Oryginalny obraz');
% subplot(1, 2, 2);
% imshow(transformedImage,[]);
% title('Przekształcony obraz');

function addAllPaths()
    shared_resources_path = fullfile('..', '..', 'Shared resources');
    
    addpath(genpath(shared_resources_path));
    addpath(genpath(pwd));
end