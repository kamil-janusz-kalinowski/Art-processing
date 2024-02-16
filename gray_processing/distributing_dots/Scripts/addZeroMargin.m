function matrix_with_margins = addZeroMargin(matrix, range_margin)
    size_matrix = size(matrix);
    range_x = range_margin : (size_matrix(2)-range_margin);
    range_y = range_margin : (size_matrix(1)-range_margin);

    matrix_with_margins = zeros(size_matrix);
    matrix_with_margins(range_y, range_x) = matrix(range_y, range_x);
end
