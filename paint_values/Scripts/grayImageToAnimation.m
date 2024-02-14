function grayImageToAnimation(data_img, data_gif)
    h = waitbar(0,'Processing...');
    for ii = 1 : data_gif.num_of_frames
        colorImage = colorizeImageWithShift(data_img.img, -ii*data_gif.shift_speed, data_img.mask, data_img.colorMap);
        writeGif(colorImage, data_gif.name_save_file, data_gif.delay_time);

        waitbar(ii/data_gif.num_of_frames, h, sprintf('Processing... %0.2f%%', ii/data_gif.num_of_frames*100)); % Aktualizacja paska ładowania
    end
    close(h);
end