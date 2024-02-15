function colorImage = colorizeImageWithShift(grayImage, value_shift, mask, colorMap)
    if nargin < 3
        mask = grayImage ~= 0;
    end

    gray_image_shifted = double(grayImage) + value_shift .* double(mask);
    colorImage = colorizeImage(gray_image_shifted, mask, colorMap);
end
