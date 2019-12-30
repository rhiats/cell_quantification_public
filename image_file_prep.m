%Author: Rhia Singh 
%Dates: November 18, 2019 
%Purpose: Prepare image file for analysis using the subsequent algorithms. 

 
%Input: .PNG file of image. Split channel on Nikon (normalize the
%intensities). Split channels and save in fiji to preserve the 3 dimensions needed for the functions. 

%Output: Convert the RGB image to a greyscale image with normalized
%intensities.

function modified = image_file_prep(img)  
    original = imread(img);

% Convert unit8/unit16 image to a double image 
    double_image = double(original);
    
% Manually scale a double image to a range between [0,1] (Pixel Normalization to speed up algorithm) 
    scaled_img = mat2gray(double_image);

% Convert 3 channel scaled RGB image to a scaled grayscale - dimension reduction
    grayscale = rgb2gray(scaled_img);
    modified = imwrite(grayscale, 'grayscale.png');
end