%Rhia Singh 
%January 7, 2019 
%Input: Provide image without overlap.  
%Output: Number of cells with co-localization. 

function [overlap_location,num_overlap] = co_loc(chan, dapi)
    
    %Make dapi the second channel - chan_b 
%     chan_a = imread("I_cells.png");
%     chan_b = imread("d.png");
    
    chan_a = imread(chan);
    chan_b = imread(dapi);

    %Find the centroid and radius of cells in each image. 
    stats_a = regionprops('table', chan_a,'Centroid','MajorAxisLength','MinorAxisLength');
    centers_a = stats_a.Centroid;
    diameters_a = mean([stats_a.MajorAxisLength stats_a.MinorAxisLength],2);
    radii_a = diameters_a/2;
    
    stats_b = regionprops('table', chan_b,'Centroid','MajorAxisLength','MinorAxisLength');
    centers_b = stats_b.Centroid;
    diameters_b = mean([stats_b.MajorAxisLength stats_b.MinorAxisLength],2);
    radii_b = diameters_b/2;
    
    set_one_circles = length(centers_a);
    set_two_circles = length(centers_b);
    
    %There are multiple cells in one channel that overlap with cells in the
    %other channel. Many different gfp cells overlap with many tdt cells.
    
    %Find the location and number of collocalized cells.
    num_overlap = 1;
    cell_found = 0;
    
    i = 1;
    
    k = set_two_circles;
    j = 1;
    
    while i < set_one_circles
        cell = centers_a(i,:);
        cell_rad = radii_a(i); %Larger cell will with tdt/gfp

        while j < k
            
            % Find the distance between 2 cells.
            d = sqrt(power(cell(1) - centers_b(j,1),2) + power(cell(2) - centers_b(j,2),2));

            % Find the largest radii between the 2 cells being compared.
%             if radii_b(j) > cell_rad
%                 larger_cell = centers_b(j);
%             end
            
            %If the distance b/w the centroids is less than the radius of
            %the larger cell, then the cells are collocalized.
            if cell_found == 0
                if d < cell_rad
                    num_overlap = num_overlap + 1;
                    overlap_location(num_overlap,1) = centers_a(i,1);
                    overlap_location(num_overlap,2) = centers_a(i,2);
                    overlap_location(num_overlap,3) = cell_rad;                    
                    centers_b(j,:) = [];
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
    save('output.mat','overlap_location');  
end

    
    