%Rhia Singh 
%January 7, 2019 
%Input: Provide image without overlap.  
%Output: Number of cells with co-localization. 

function [overlap_location,num_overlap] = co_loc(no_overlap_chan_one, no_overlap_chan_two)
    
    chan_a = imread(no_overlap_chan_one);
    chan_b = imread(no_overlap_chan_two);
    
    %Find the centroid and radius of cells in each image. 
    stats_a = regionprops('table', chan_a,'Centroid','MajorAxisLength','MinorAxisLength');
    centers_a = stats_a.Centroid;
    diameters_a = mean([stats_a.MajorAxisLength stats_a.MinorAxisLength],2);
    radii_a = diameters_a/2;
    
    stats_b = regionprops('table', chan_b,'Centroid','MajorAxisLength','MinorAxisLength');
    centers_b = stats_b.Centroid;
    diameters_b = mean([stats_b.MajorAxisLength stats_b.MinorAxisLength],2);
    radii_b = diameters_b/2;
    
    %Find the smallest number of cells in the image. 
    length_center_a = length(centers_a);
    length_center_b = length(centers_b);
    
    if length_center_a <= length_center_b
        search = length_center_a;
        more_cells = length_center_b;
    else
        search = length_center_b;
        more_cells = length_center_a;
    end
    
    %Find the location and number of collocalized cells.
    num_overlap = 0;
    overlap_location(search,6) = nan;
    
    for i = 1:more_cells
        curr_cell_rad = radii_a(i);
        
        for j = 1:search
            
            % Find the distance between 2 cells.
            d = sqrt(power(centers_a(i,1) - centers_b(j,1),2) + power(centers_a(i,2) - centers_b(j,2),2));
            
            % Find the largest radii between the 2 cells being compared.
            larger_cell = curr_cell_rad;
            if radii_b(j) > larger_cell
                larger_cell = radii_b(j);
            end
            
            %If the distance b/w the centroids is less than the radius of
            %the larger cell, then the cells are collocalized. 
            
            if d <= larger_cell
                
                num_overlap = num_overlap + 1;
                
                % Location of overlapping cells
                overlap_location(num_overlap,1) = centers_a(i,1);
                overlap_location(num_overlap,2) = centers_a(i,2);
                overlap_location(num_overlap,3) = centers_b(j,1);
                overlap_location(num_overlap,4) = centers_b(j,2);
                overlap_location(num_overlap,5) = larger_cell;
                overlap_location(num_overlap,6) = d;
            end
        end
        
    end
    
    disp(num_overlap);
    save('overlap_location');
end

    
    