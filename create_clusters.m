function [ clusters ] = create_clusters(cell_au, targets)

    clusters = cell(6,1);
    
    for i = 1:length(targets)
        clusters{targets(i)} = [clusters{targets(i)}; cell_au(i)];
    end
    
    for i = 1:length(clusters)
       clusters{i} = create_cluster_cases(clusters{i}, i);
    end
    
end

