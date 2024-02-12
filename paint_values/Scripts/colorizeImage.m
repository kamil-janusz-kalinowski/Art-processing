function colorImage = colorizeImage(grayImage, mask, colorMap)
    % Zdefiniuj kolorowe mapy (możesz je dostosować do swoich preferencji)

    % Inicjalizuj obraz kolorowy
    colorImage = zeros(size(grayImage, 1), size(grayImage, 2), 3);

    % Kolorowanie na podstawie intensywności piksela
    for i = 1:size(grayImage, 1)
        for j = 1:size(grayImage, 2)

            intensity = grayImage(i, j);
            if mask(i,j)
                intensity = mod(intensity, 255) + 1;
                colorImage(i, j, :) = colorMap(intensity, :);
            end
        end
    end
end