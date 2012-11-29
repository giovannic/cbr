function [ cbr ] = CBRinit_cluster( x, y, num_clusters, k )
%CBRINIT_CLUSTER returns a cbr system with clusters
%   use_num clusters to specifiy number of clusters and k to specify how
%   many children each cluster has. The returned crb is an array of cluster
%   nodes. these nodes contain the case (which will be compared against in
%   retrieval always) and the nearest k neighbours represented as a struct
%   of cbr case and similarity to cluster node.
cbr_temp = [];

% randomises order of x and y
reorder = randperm(size(x,1));
x = x(reorder,:);
y = y(reorder,:);

gap = floor(length(x)/num_clusters);

for i = 1 : length(x)
    this_case = (create_case(create_AU(x(i,:)), y(i)));
    cbr_temp = retain( cbr_temp, this_case );
end
updated = 0;
iteration = 1;
for i = 1 : gap : length(cbr_temp)
    cluster_node.case = cbr_temp(i);
    cluster_node.nearest = struct('case', {}, 'similarity', 0);
    min_sim = Inf;
    for j = 1 : length(cbr_temp)
        if ~compare_case_equality(cbr_temp(i), cbr_temp(j))
            this_sim = compute_similarity_length( cluster_node.case, cbr_temp(j) );
            if size(cluster_node.nearest,1) < k
                cluster_node.nearest = [ cluster_node.nearest ; struct('case', cbr_temp(j), 'similarity', this_sim) ];
                if this_sim < min_sim
                    min_sim_case = cbr_temp(j);
                    min_sim = this_sim;
                end
            elseif this_sim >= min_sim
                for a = 1 : k
                    if compare_case_equality( cluster_node.nearest(a).case, cbr_temp(j) )
                        cluster_node.nearest(a).typicality = cluster_node.nearest(a).typicality + 1;
                        break;
                    elseif compare_case_equality( cluster_node.nearest(a).case, min_sim_case);
                        updated = 1;
                        cluster_node.nearest(a) = struct('case', cbr_temp(j), 'similarity', this_sim);
                        min_sim = this_sim;
                    end
                end
                if updated
                    for a = 1 : k
                        if cluster_node.nearest(a).similarity < min_sim
                            min_sim = cluster_node.nearest(a).similarity;
                            min_sim_case = cluster_node.nearest(a).case;
                        end
                    end
                    updated = 0;
                end
            end
        end
    end
    cbr(iteration) = cluster_node;
    iteration = iteration + 1;
end

end

function [ is_equal ] = compare_case_equality( c1, c2 )
is_equal = isequal(c1.au_vector, c2.au_vector) && isequal(c1.solution, c2.solution);
end
