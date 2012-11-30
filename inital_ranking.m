function [ cluster_cell_array ] = inital_ranking(cluster_cell_array)


%rankings      = {[], [], [], [], [], []};

for i = 1:length(cluster_cell_array) 
    cluster       = cluster_cell_array{i};
    sim_matrix    = zeros(length(cluster), length(cluster));  

    layer1 = repmat(cluster', length(cluster), 1);
    layer2 = repmat(cluster, 1, length(cluster));
    sim_matrix  = arrayfun(@(x, y) compute_similarity_cosine(x , y), layer1, layer2);
       
   
    average_sims = (sum (sim_matrix, 2) - 1) / (length(cluster) - 1);
  
    
    cluster = arrayfun(@(x, y) setfield(x, 'average_sim', y), cluster, average_sims);
    
    %cluster(j).average_sim = sum(sim_matrix(j,:)) / (length(cluster) - 1);

    cluster_cell_array{i} = cluster;
     
end

end

 
