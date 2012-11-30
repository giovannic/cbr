function [ cbr_system ] = CBRinit_john( x, y )
%Given x examples and y targets lets create clusters
cluster_cell_array = create_clusters(exam_to_au(x), y);
%Rank how similar each cluster is to each other 
%sim_rankings = inital_ranking(cluster_cell_array);
cluster_cell_array = inital_ranking(cluster_cell_array);


for i = 1:length(sim_rankings)
    cbr_system.clusters{i} = [];
    cluster                = cluster_cell_array{i};
    rankings               = sim_rankings{i};
    for j = 1:length(cluster);
        cbr_system.clusters{i} = insert_heap(cbr_system.clusters{i}, cluster(j), rankings(j)); 
    end
end

cbr_system.num_tiers = 3;
cbr_system.tier_size = 3;
cbr_system.clusters  = [];

%clusters = initalise_cluters(cluster_cell_array, cbr_system.num_tiers, cbr_system.tier_size);

end

