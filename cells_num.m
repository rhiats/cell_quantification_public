%Rhia Singh 
%January 7, 2019 
%Input: Provide image that does not have overlap.  
%Output: Number of cells in the image  

function [locs,num] = cells_num(no_overlap)
    
    I = imread(no_overlap);
    [locs, num] = bwlabel(I);
    disp(num);
end