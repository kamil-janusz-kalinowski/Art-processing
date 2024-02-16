# Art-processing

The 'Art-processing' repository contains various folders with code aimed at artistic image processing and manipulation. For instance, the 'paint_values' folder provides functionalities to colorize grayscale images based on pixel values and generate animations using such transformations. On the other hand, the 'gray_processing' folder houses functions dedicated to manipulating grayscale images.

This project is primarily undertaken for the purposes of personal development and experimentation, offering a playground for exploring creative image processing techniques.


## Paint_values
The paint_values folder contains the utilization of functions for coloring grayscale images based on a specified colormap by assigning a color to each shade of gray. It also includes a function for saving animations in gif format. The animation involves shifting the color assignments by an added value.




## Gray_processing
In the gray_processing directory, transformations operating on grayscale images are presented. These transformations accept grayscale images as input and return grayscale images as output. The 'gray_processing' folder contains three subprojects:

1. distributing_dots: This subproject includes a function that distributes N white dots based on a grayscale image. The brightness of pixels is used as a probabilistic density for the placement of dots, ensuring they do not overlap. Plans include adding an iterative version where randomly placed dots move to achieve optimal distribution density.

2. rasterization: This subproject comprises methods to convert grayscale images into their representations using various shapes. It includes techniques such as tile averaging, representing image segments as ellipses, and diamonds.

3. transformation: This subproject is intended for various unconventional image transformations. Currently, the main file contains an unfinished version of horizontal blur. However, there's an issue when the background intensity is greater than 0, leading to a cascading increase in intensity until reaching masked pixels, resulting in a halo effect on dark objects. Work in progress...

