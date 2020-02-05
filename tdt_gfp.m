%Rhia Singh 
%January 7, 2019 
%Input: Provide image without overlap.  
%Output: Number of cells with co-localization. 

function [overlap_location,num_overlap] = co_loc(gfp, tdt)
    
%     chan_a = load('gfp_true.mat');
%     chan_b = load('tdt_true.mat');
    
    chan_a = load(gfp);
    chan_b = load(tdt);
    
    %There are multiple cells in one channel that overlap with cells in the
    %other channel. Many different gfp cells overlap with many tdt cells.
    
    set_one_cells = chan_a.overlap_location;
    set_two_cells = chan_b.overlap_location;
    
    len_set_one = length(set_one_cells);
    len_set_two = length(set_two_cells);
    
    %Find the location and number of collocalized cells.
    num_overlap = 0;
    cell_found = 0;
    i = 1;
    
    k = len_set_two;
    j = 1;
    
    while i < len_set_one   
        cell = set_one_cells(i,:);
        cell_rad = set_one_cells(i,3);
        larger_cell = cell_rad;
        while j < k
            
            % Find the distance between 2 cells.
            d = sqrt(power(cell(1) - set_two_cells(j,1),2) + power(cell(2) - set_two_cells(j,2),2));

            % Find the largest radii between the 2 cells being compared.
            if set_two_cells(j,3) > cell_rad
                larger_cell = set_two_cells(j,3);
            end
            
            %If the distance b/w the centroids is less than the radius of
            %the larger cell, then the cells are collocalized. 
            if cell_found == 0
                if d < larger_cell 
                    num_overlap = num_overlap + 1;
                    set_two_cells(j,:) = [];
                    k = k - 1;
                    cell_found = 1;
                end
            end
            j = j + 1;
        end
        j = 1;
        i = i + 1;
        cell_found = 0;
    end
    
    disp(num_overlap);
%     save('overlap_location');
end

    
    