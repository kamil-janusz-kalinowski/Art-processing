function vect_blur = blur_vect_nonzero(vect, sigma, gauss_size)
    vect_blur = zeros(size(vect));
    vect_temp = zeros(1, gauss_size);
    kernel = gausswin(gauss_size, sigma);
    kernel = kernel / sum(kernel);

 
    
    vect_len = length(vect);
    gauss_range = floor(gauss_size/2);
    for ii = 1 : length(vect)
        if vect(ii) ~= 0
            inds = (-gauss_range : gauss_range) + ii;
    
            % Sprawdzenie, czy indeks 1 znajduje się w zakresie
            if any(inds == 1)
                ind_border = find(inds == 1);
                inds_replace = 1 : (ind_border-1);
                
                % Zastąpienie indeksów lustrzanym odbiciem
                inds_to_replace = circshift(inds(inds_replace), [0, ind_border-1]);
                inds(inds_replace) = inds_to_replace(end:-1:1);
            end

            % Sprawdzenie, czy granica z drugiej strony nie została przekroczona
            if any(inds == length(vect))
                ind_border = find(inds == length(vect));
                inds_replace = (ind_border+1) : length(inds);
                
                % Zastąpienie indeksów lustrzanym odbiciem
                %inds_to_replace = circshift(inds(inds_replace), [0, -(length(inds)-ind_border)]);
                inds(inds_replace) = inds_replace-1-(inds_replace-ind_border);
            end
            
            vect_temp = vect(inds);
            is_zero = vect_temp == 0;
            if ~isempty(is_zero)
                vect_temp = vect_temp + vect_temp(end:-1:1) .* double(is_zero);
            end

            vect_blur(ii) = sum(kernel.*vect_temp');
        end
    end
    
end
