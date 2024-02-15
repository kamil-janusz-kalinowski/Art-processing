function processedImage = preprocessGrayImage(image)
    % preprocessGrayImage - Preprocesses grayscale images.
    %
    %   processedImage = preprocessGrayImage(image)
    %
    %   This function preprocesses grayscale images by adjusting the contrast
    %   and scaling the pixel values to the range [0, 255]. If the input image
    %   is in RGB format, it is converted to grayscale before preprocessing.
    %
    %   Arguments:
    %   - image: Input grayscale or RGB image.
    %
    %   Returns:
    %   - processedImage: Preprocessed image.
    %

    % Check if the image is in RGB format
    if ndims(image) == 3 && size(image, 3) == 3
        % Convert RGB image to grayscale
        grayImage = rgb2gray(image);
    else
        grayImage = image; % Image is already grayscale
    end

    % Convert the image to double type
    grayImage = im2double(grayImage);

    % Adjust the contrast of the image
    adjustedImage = imadjust(grayImage, [min(grayImage(:)), max(grayImage(:))], [0, 1]);

    % Scale the pixel values to the range [0, 255]
    scaledImage = uint8(adjustedImage * 255);

    % Return the preprocessed image
    processedImage = scaledImage;
end