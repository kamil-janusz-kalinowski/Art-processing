function img_transformed = transform_image(grayImage, gauss_range, sigma)
    mask_nonzero = grayImage ~= 0;
    img_transformed = zeros(size(grayImage));

    img_transformed(1,:) = grayImage(1,:);
    for yy = 2 : size(img_transformed, 1)
        layer_upper = img_transformed(yy-1, :);
        layer_current = double(grayImage(yy, :));

        layer_combined = (layer_upper + layer_current) ./ (2 .^ mask_nonzero(yy-1, :)) .* (layer_current ~= 0);

        img_transformed(yy,:) = blur_vect_nonzero(layer_combined, sigma, gauss_range);
    end
end