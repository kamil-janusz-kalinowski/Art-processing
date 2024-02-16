# Art-processing

The 'Art-processing' repository contains various folders with code aimed at artistic image processing and manipulation. For instance, the 'paint_values' folder provides functionalities to colorize grayscale images based on pixel values and generate animations using such transformations. On the other hand, the 'gray_processing' folder houses functions dedicated to manipulating grayscale images.

This project is primarily undertaken for the purposes of personal development and experimentation, offering a playground for exploring creative image processing techniques.


## Paint_values
The paint_values folder contains the utilization of functions for coloring grayscale images based on a specified colormap by assigning a color to each shade of gray. It also includes a function for saving animations in gif format. The animation involves shifting the color assignments by an added value.

![cup1_romaO](https://github.com/kamil-janusz-kalinowski/Art-processing/assets/143912944/d9cd9525-d5b8-4bee-89d7-78f2c51de4dd)

![cup1_RGB](https://github.com/kamil-janusz-kalinowski/Art-processing/assets/143912944/3f3e7ea0-e3e5-4bcb-a6c4-0e0764267d1d)

## Gray_processing
In the gray_processing directory, transformations operating on grayscale images are presented. These transformations accept grayscale images as input and return grayscale images as output. The 'gray_processing' folder contains three subprojects:

1. distributing_dots: This subproject includes a function that distributes N white dots based on a grayscale image. The brightness of pixels is used as a probabilistic density for the placement of dots, ensuring they do not overlap. Plans include adding an iterative version where randomly placed dots move to achieve optimal distribution density.

![dot distribution](https://github.com/kamil-janusz-kalinowski/Art-processing/assets/143912944/1057bcb8-5814-4880-9ee6-b5d1d6d966da)

2. rasterization: This subproject comprises methods to convert grayscale images into their representations using various shapes. It includes techniques such as tile averaging, representing image segments as ellipses, and diamonds.

![rasterization](https://github.com/kamil-janusz-kalinowski/Art-processing/assets/143912944/482a6038-fd4e-4cdc-bb8e-1bcc8b9c6ff0)

3. transformation: This subproject is intended for various unconventional image transformations. Currently, the main file contains an unfinished version of horizontal blur. However, there's an issue when the background intensity is greater than 0, leading to a cascading increase in intensity until reaching masked pixels, resulting in a halo effect on dark objects. Work in progress...

![horizontal blur](https://github.com/kamil-janusz-kalinowski/Art-processing/assets/143912944/6880a52c-772d-4895-9747-b0222d0debf9)

![bug transform](https://github.com/kamil-janusz-kalinowski/Art-processing/assets/143912944/db3fb8fe-b566-44e5-a9d1-c809d09e9b9a)

