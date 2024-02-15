function seg_boxes = calcSegmentsOfMat(size_mat, size_segment)
    num_of_seq = floor(size_mat./size_segment);
    %nadmiar = size_mat - num_of_seq*size_segment;
    
    seg_boxes = zeros(num_of_seq(1)*num_of_seq(2), 4);
    for ind_y = 1 : num_of_seq(1)
        for ind_x = 1 : num_of_seq(2)
            pos1 = [size_segment(1)*(ind_y-1), size_segment(2)*(ind_x-1)]+1;
            pos2 = [size_segment(1)*(ind_y), size_segment(2)*(ind_x)];
            seg_boxes(ind_x+(ind_y-1)*num_of_seq(2), :) = [pos1, pos2];
        end
    end

    %Transform matrix from [y1,x1,y2,x1] -> [x1,y1,x2,y1]
    seg_boxes = seg_boxes(:,[2,1,4,3]);
end
