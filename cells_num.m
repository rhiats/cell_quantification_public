%Rhia Singh 
%January 7, 2019 
%Input: Provide image that does not have overlap.  
%Output: Number of cells in the image  

function [centers,locs,num] = cells_num(no_overlap)
    
    I = imread(no_overlap);
    
    %Create a label matrix and store the number of cells in num. 
    [locs, num] = bwlabel(I);
    
    %Find the centroid and radius of cells in each image. 
    stats = regionprops('table', I,'Centroid','MajorAxisLength','MinorAxisLength');
    centers = stats.Centroid;
    
    disp(num);
end