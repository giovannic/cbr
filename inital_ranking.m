function [ cluster_cell_array ] = inital_ranking(cluster_cell_array)

%rankings      = {[], [], [], [], [], []};

for i = 1:length(cluster_cell_array) 
    cluster       = cluster_cell_array{i};
    sim_matrix    = zeros(length(cluster), length(cluster));  
   % averages      = zeros(length(cluster), 1);
    for j = 1:length(cluster)
       for k = (j + 1):length(cluster)
           sim_matrix(j, k) = compute_similarity_distance(cluster(j), cluster(k));
           sim_matrix(k, j) = sim_matrix(j, k);
       end
     %  averages(j, 1) = sum(sim_matrix(j,:)) / (length(cluster) - 1);
     cluster(j).average_sim = sum(sim_matrix(j,:)) / (length(cluster) - 1);
    end
    cluster_cell_array{i} = cluster;
 %   rankings{i} = averages;
     
end


end

