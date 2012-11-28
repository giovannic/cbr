function [ handle ] = get_sim_function( function_num )
%returns whatever function you need to use
% e.g handle = get_sim_function( y )  y = {1, 2, 3}
% handle(function_arguments);

switch(function_num)
    case 1
        handle = @compute_similarity_length;
    case 2
        handle = @compute_similatiy_distace;
    case 3
        handle = [];    %to-do
end

end

