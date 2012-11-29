function [ clusters ] = create_clusters(cell_au, targets)
    clusters = {[], [], [], [], [], []};
    
    for i = 1:length(targets)
        clusters{targets(i)} = [clusters{targets(i)}; cell_au(i)];
    end
    
end

