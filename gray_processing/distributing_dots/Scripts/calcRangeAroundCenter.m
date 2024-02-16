function [xx_range, yy_range] = calcRangeAroundCenter(centerXY, radius)
    yy_range = (centerXY(2)-radius) : (centerXY(2)+radius);
    xx_range = (centerXY(1)-radius) : (centerXY(1)+radius);
end
