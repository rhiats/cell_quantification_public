# cell_quantification_public
Designed by Rhia Singh 

- Use this MATLAB script to count the number of cells in a Immunohistochemistry stain and to quanitfy colabeled cells.

- Order of use:
1. Use image_file_prep.m to create a scaled grayscale image.
2. Use adjust_contrast_binary.m to modify the contrast of the grayscale image to improve identification of cells + noise. 
3. Use binary_img.m to convert the contrast adjusted grayscale image to a binary image using Outsu Thresholding.
4. Use remove_noise.m to remove objects in the image that are smaller than a radius of 1.
5. Use sep_overlap.m to separate touching objects using watershedding. 
6. Use cells_num.m to count the number of DAPI cells. 
7. Use co_loc.m to count the number of cells that overlap with DAPI.
8. Use tdt_gfp.m to find cells that express both GFP and TDT. 
