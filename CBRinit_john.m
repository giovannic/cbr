function [ cbr_system ] = CBRinit_john( x, y )
%Given x examples and y targets lets create clusters
cluster_cell_array = create_clusters(exam_to_au(x), y);
%Rank how similar each cluster is to each other 
sim_rankings = inital_ranking(cluster_cell_array);


end

