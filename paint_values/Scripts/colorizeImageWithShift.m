function colorImage = colorizeImageWithShift(grayImage, value_shift, mask, colorMap)
    if nargin < 3
        mask = grayImage ~= 0;
    end

    grayImage = double(grayImage) + value_shift .* double(mask);
    colorImage = colorizeImage(grayImage, mask, colorMap);
end
