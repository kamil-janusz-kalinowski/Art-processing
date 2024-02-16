function img = addCircleToImg(img, posXY, radius_circle)
    
    [xx_range, yy_range] = calcRangeAroundCenter(posXY, radius_circle);

    img_part = img(yy_range, xx_range);
    
    img_circle = drawEllipse([1,1]*(2*radius_circle+1), 1);
    mask = img_circle ~= 0;
    img_part(mask) = img_circle(mask);
    
    img(yy_range, xx_range) = img_part;
end
