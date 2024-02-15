function img_transformed = transform_image_experimental(grayImage, gauss_range, sigma, memory_of_layers, weights)
    grayImage = double(grayImage);
    img_transformed = zeros(size(grayImage));

    img_transformed(1:memory_of_layers,:) = grayImage(1:memory_of_layers,:);

    for yy = (memory_of_layers+1) : size(img_transformed, 1)
        layer_combined = zeros(1,size(grayImage,2));
        
        layer_current = grayImage(yy,:);
        layer_combined = layer_combined + layer_current*weights(1).*(layer_current ~= 0);
        for ii = 1 : memory_of_layers
            layer_current = img_transformed(yy-ii,:);
            layer_combined = layer_combined + layer_current .*...
                                              (layer_current ~= 0) *...
                                              weights(ii+1);
        end

        img_transformed(yy,:) = blur_vect_nonzero(layer_combined, sigma, gauss_range);
        disp(string(round( (yy-(memory_of_layers+1)) /(size(img_transformed, 1)-(memory_of_layers+1)) *100,2))+"%")
    end
end