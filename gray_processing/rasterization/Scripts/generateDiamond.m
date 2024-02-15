function img_transformed = generateDiamond(img_part, value_range)
    value_mean = mean(img_part,"all");
    size_img = size(img_part);
    
    radius_ratio = (value_mean-value_range(1))/(value_range(2)-value_range(1));
    img_transformed = drawDiamond(size_img, radius_ratio);
end

function matrix = drawDiamond(size_mat, radius_ratio)
    if nargin < 2
        radius_ratio = 1;
    end
    
    matrix = zeros(size_mat);

    % Obliczanie rozmiaru macierzy
    rows = size_mat(1);
    cols = size_mat(2);
    
    % Obliczanie współrzędnych środka macierzy
    center_row = round(rows / 2);
    center_col = round(cols / 2);

    radius = min(size_mat);
    
    % Obliczanie promienia elipsy
    %radius = min(center_row, center_col);
    
    % Tworzenie siatki współrzędnych
    [X, Y] = meshgrid(1:cols, 1:rows);
    
    % Obliczanie dystansu od środka macierzy
    distance = abs((X - center_col)/(center_col-1)) + abs((Y - center_row)/(center_row-1));
    
    % Tworzenie maski dla elipsy
    ellipse_mask = distance <= radius_ratio;
    
    % Rysowanie elipsy na macierzy
    matrix(ellipse_mask) = 1;
end