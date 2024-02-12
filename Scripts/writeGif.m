function writeGif(colorImage, outputFileName, delayTime)
    % writeGif - Writes a color image to a GIF file.
    %
    %   writeGif(colorImage, outputFileName, delayTime)
    %
    %   This function writes a color image to a GIF file. If the file with
    %   the given name does not exist, it creates a new GIF file and writes
    %   the first frame. If the file already exists, it appends the color
    %   image as a new frame.
    %
    %   Arguments:
    %   - colorImage: Color image to write.
    %   - outputFileName: Name of the output GIF file.
    %   - delayTime: Delay time for each frame in seconds.
    %

    % Convert color image to indexed image with a color map of 256 colors
    [indexedImage, colmap] = rgb2ind(colorImage, 256); % Convert to indexed image

    % Check if the file with the given name exists
    if exist(outputFileName, 'file') ~= 2
        % If the file does not exist, write the first frame with Loopcount set to inf
        imwrite(indexedImage, colmap, outputFileName, 'gif', 'Loopcount', inf, 'DelayTime', delayTime);
    else
        % If the file exists, append the indexed image as a new frame
        imwrite(indexedImage, colmap, outputFileName, 'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
    end
end