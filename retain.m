function [cbr] = retain( cbr, solved_case )

emotion = solved_case.solution;
cluster = cbr.clusters{emotion};

n = cluster.n;
for i = 1 : n
    this_sim = compute_similarity_cosine(solved_case, cluster(i));
    cluster(i).average_sim = (cluster(i).average_sim*(n-1)+this_sim)/n;
    solved_case.average_sim = solved_case.average_sim + this_sim;
end
solved_case.average_sim = solved_case.average_sim/n;
cluster = [ cluster; solved_case ];
cluster.n = n+1;

cluster = remove_duplicate_cases(cluster);
cluster = case_sort(cluster);

cbr.clusters{emotion} = cluster;
end