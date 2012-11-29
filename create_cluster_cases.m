function [ cases ] = create_cluster_cases( cluster, label )
cases = [];

    for i = 1:length(cluster)
        cases = [cases; create_case(cluster{i}, label)]
    end

end

