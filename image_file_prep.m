%Author: Rhia Singh 
%Dates: November 18, 2019 
%Purpose: Prepare image file for analysis by modifying file types.
 
%Input: .PNG file of GFP or tdt channel from the image. Split channels in
%fiji. 

%Output: Saved grayscale of image with necessary modifications for cell
%identification.

function grayscale = image_file_prep(img)  
    original = imread(img);

% Convert unit8/unit16 image to a double image 
    double_image = double(original);
    
% Manually scale a double image to a range between [0,1] (Pixel Normalization to speed up algorithm) 
    scaled_img = mat2gray(double_image);

% Convert 3 channel scaled RGB image to a scaled grayscale - dimension reduction
    grayscale = scaled_img;
    imwrite(grayscale, 'grayscale.png');
end