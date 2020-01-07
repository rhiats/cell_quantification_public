%Rhia Singh 
%January 6, 2019 
%Input: Provide the image that was pre-processed into the correct format. 
%Output: Saves an image with the enhavnced contrast and smoothed
%illuminations. 

function contrastAdjusted = adjust_contrast_binary(img_processed)
%% Correct for the uneven illuminations in the image 
    se = strel('disk',12);
    tophatFiltered = imtophat(img_processed,se);
    %figure
    %imshow(tophatFiltered,[]); 

%% Adjust the contrast in the image
    contrastAdjusted = imadjust(tophatFiltered);
    imwrite(grayscale, 'grayscale.png');
    %figure
    %imshow(contrastAdjusted,[]);
end