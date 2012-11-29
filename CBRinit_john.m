function [ cbr_system ] = CBRinit_john( x, y )
%Given x examples and y targets lets create clusters
cluster_cell_array = create_clusters(exam_to_au(x), y);
%Rank how similar each cluster is to each other 
sim_rankings = inital_ranking(cluster_cell_array);

for i = 1:length(sim_rankings)
    cbr_system.cluster{i} = [];
    cluster               = cluster_cell_array{i};
    rankings              = sim_rankings{i};
    for j = 1:length(cluster);
        cbr_system.cluster{i} = insert_heap(cbr_system.cluster{i}, cluster(j), rankings(j)); 
    end
end

end

