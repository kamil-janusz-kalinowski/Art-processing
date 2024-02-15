function img_rastered = rasterizationImg(img, seg_boxes, generatingRasterFun)
    [x_min, ~, y_min, ~, y_range, x_range] = calculateRangesFromBoxes(seg_boxes);
    
    img_rastered = zeros(y_range, x_range);
    
    for ii = 1 : size(seg_boxes,1)
        current_box = seg_boxes(ii,:);
        img_part = cropImage(img, current_box);

        % Używanie przekazanej funkcji transformacji z dodatkowymi argumentami
        img_part_transformed = generatingRasterFun(img_part);

        [x_inds, y_inds] = getIndsWithShiftFromBox(current_box, [x_min, y_min]);

        img_rastered(y_inds, x_inds) = img_part_transformed;
    end
end

function [x_min, x_max, y_min, y_max, y_range, x_range] = calculateRangesFromBoxes(seg_boxes)
    % Obliczanie minimalnej i maksymalnej wartości dla kolumny 2 (x)
    x_min = min(seg_boxes(:, 2)); 
    x_max = max(seg_boxes(:, 2));

    % Obliczanie minimalnej i maksymalnej wartości dla kolumny 1 (y)
    y_min = min(seg_boxes(:, 1)); 
    y_max = max(seg_boxes(:, 1));

    % Obliczanie zakresu dla kolumny y i x
    y_range = x_max - x_min;
    x_range = y_max - y_min;
end

function [x_inds, y_inds] = getIndsWithShiftFromBox(box, xy_min)
    x_min = xy_min(1);
    y_min = xy_min(2);

    x_inds = (box(1)-x_min+1) : (box(3)-x_min+1);
    y_inds = (box(2)-y_min+1) : (box(4)-y_min+1);
end
