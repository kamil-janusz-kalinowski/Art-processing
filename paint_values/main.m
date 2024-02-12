clc; clear; close all;
add_all_paths()

%% Paint image based on values
colorMap = crameri('vikO');

% Wczytaj obraz szary
grayImage = double(imread('Picture2.png')); % Zmień 'nazwa_obrazu.jpg' na nazwę Twojego obrazu
grayImage = (grayImage - min(grayImage,[],'all'))/max(grayImage,[],'all')*255;
grayImage = round(grayImage);

mask = grayImage ~= 0;

colorImage = colorizeImage(grayImage, mask, colorMap);

% Wyświetlenie obrazów
figure()
subplot(1, 2, 1), imshow(grayImage,[]), title('Obraz szary');
subplot(1, 2, 2), imshow(colorImage), title('Kolorowany obraz');



%% Evolution over time
% Wczytaj obraz szary
img_name = 'orzeu.png';
outputFileName = 'orzeu5.gif'; 

shift_speed = 2;
time_of_animation = 2; % Seconds
delayTime = time_of_animation/128;
num_of_frames = round(256/shift_speed);
repetition_factor = 1;
colorMap = crameri('vikO');

img_origin = imread(img_name);
grayImage = preprocessGrayImage(img_origin);

mask = grayImage ~= 0;
grayImage = double(grayImage)*repetition_factor;

for ii = 1 : num_of_frames
    colorImage = colorizeImageWithShift(grayImage, -ii*shift_speed, mask, colorMap);
    writeGif(colorImage, outputFileName, delayTime);

    disp(string(round(ii/num_of_frames*100,2))+"%")
end



function colorImage = colorizeImageWithShift(grayImage, value_shift, mask, colorMap)
    if nargin < 3
        mask = grayImage ~= 0;
    end

    grayImage = double(grayImage) + value_shift * double(mask);
    colorImage = colorizeImage(grayImage, mask, colorMap);
end

function add_all_paths()
    scripts_path = fullfile('..', 'Scripts');
    materials_path = fullfile('..', 'Materials');
    
    addpath(genpath(scripts_path));
    addpath(genpath(materials_path));
    addpath(genpath(pwd));
end