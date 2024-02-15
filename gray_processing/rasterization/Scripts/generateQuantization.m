function img_transformed = generateQuantization(img_part)
    value_mean = mean(img_part,"all");
    size_img = size(img_part);
    
    img_transformed = quantizeImg(size_img, value_mean);
end

function img = quantizeImg(size_img, value_mean)
    img = ones(size_img)*value_mean;
end
