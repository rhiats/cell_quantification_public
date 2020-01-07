%Rhia Singh 
%January 7, 2019 
%Input: Provide image without noise.  
%Output: Binary image containing cells and background that do not have 
%overlaps. Rename output files to account for channel.    

function no_ovrlap = sep_overlap(no_noise_img)
    I_cells = imread(no_noise_img);
    
    %Separate touching cells using watershed algorthim.
    D = -bwdist(~I_cells); 
    no_ovrlap = watershed(D);
    I_cells(no_ovrlap == 0) = 0;
    
    imwrite(I_cells, 'I_cells.png');
end