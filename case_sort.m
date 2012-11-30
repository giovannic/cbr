function [ sorted_cases ] = case_sort( cases )

fields         = fieldnames(cases);
cell_array_ver = struct2cell(cases);
cell_size      = size(cell_array_ver);
% Convert to a matrix
cell_array_ver = reshape(cell_array_ver, cell_size(1), []);      % Px(MxN)
% Make each field a column
cell_array_ver = cell_array_ver';                                % (MxN)xP
% Sort by third field 
cell_array_ver = flipud(sortrows(cell_array_ver, 3));
% Put back into original cell array format
cell_array_ver = reshape(cell_array_ver', cell_size);
% Convert to Struct
sorted_cases = cell2struct(cell_array_ver, fields, 1);

end