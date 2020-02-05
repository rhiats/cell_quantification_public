%Rhia Singh 
%January 7, 2019 
%Input: Provide binary image.  
%Output: Binary image containing cells and background.  

function img_no_noise = remove_noise(bin_img)
    
    I_noise = imread(bin_img);

%     %Remove projections
%     for i = 1:3
%         sq_se = strel('square',i);
%         remove_projections = imopen(I_noise,sq_se);
%     end
%     
%     %Remove small specs.
%     sq_se = strel('disk',4);
%     img_no_noise = imopen(remove_projections,sq_se);
%     imwrite(img_no_noise, 'no_noise_img.png');
    
    %Only keep opjects that are circular and have a radius of one
    sq_se = strel('disk',1);
    img_no_noise = imopen(I_noise,sq_se);
    imwrite(img_no_noise, 'no_noise_img.png');    
end