function [ cbr ] = CBRinit( x, y, n )

cbr.initial_tier_size = n;

%Given x examples and y targets lets create clusters
cbr.clusters = create_clusters(exam_to_au(x), y);
%Rank how similar each cluster is to each other 
cbr.clusters      = inital_ranking(cbr.clusters);
cbr.cluster_sizes = [];

for i = 1 : length(cbr.clusters)
    cbr.cluster_sizes(i) = length(cbr.clusters{i});
    cbr.clusters{i}      = remove_duplicate_cases(cbr.clusters{i});
    cbr.clusters{i}      = case_sort(cbr.clusters{i});
end



end