function data = createDataGifAnimation(outputFileName, shift_speed, time_animation)
    data.name_save_file = outputFileName; 
    data.shift_speed = shift_speed;
    data.num_of_frames = round(256/shift_speed);
    data.delay_time = time_animation/data.num_of_frames;

    if data.delay_time < 0.02
        warning("Delay time is below 0.02 seconds ("+string(round(data.delay_time,4))+"). This may cause issues with the GIF.");
    end
end