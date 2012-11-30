function [ cbr_system ] = CBRinit_john( x, y )
%Given x examples and y targets lets create clusters
cluster_cell_array = create_clusters(exam_to_au(x), y);
%Rank how similar each cluster is to each other 
%sim_rankings = inital_ranking(cluster_cell_array);
cluster_cell_array = inital_ranking(cluster_cell_array);

for i = 1:length(cluster_cell_array)
    cluster_cell_array{i} = remove_duplicate_cases(cluster_cell_array{i});
end

cbr_system.num_tiers = 3;
cbr_system.tier_size = 3;
cbr_system.clusters  = [];

%clusters = initalise_cluters(cluster_cell_array, cbr_system.num_tiers, cbr_system.tier_size);

end

