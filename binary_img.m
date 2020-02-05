%Rhia Singh 
%January 7, 2019 
%Input: Provide enhanced contrast image.  
%Output: Binary image containing cells, noise and background.  

function img_bin = binary_img(con_img)
    
    I_processed = imread(con_img);

    %% Convert contrast enhanced image to a binary one using Outu's method for global image thresholding. 
    level = graythresh(I_processed); 
    img_bin = imbinarize(I_processed,level);
    imwrite(img_bin, 'bin_img.png');
end