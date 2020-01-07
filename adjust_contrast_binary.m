%Rhia Singh 
%January 6, 2019 
%Input: Provide the image that was pre-processed into the correct format through image file prep function. 
%Output: Saves an image with the enhanced contrast and smoothed
%illuminations. 

function contrastAdjusted = adjust_contrast_binary(img_processed)
    
    I_processed = imread(img_processed);
%% Correct for the uneven illuminations in the image 
    se = strel('disk',12);
    tophatFiltered = imtophat(I_processed,se);

%% Adjust the contrast in the image
    contrastAdjusted = imadjust(tophatFiltered);
    imwrite(contrastAdjusted, 'contrast_adjust_grayscale.png');
end