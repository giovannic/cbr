function [cbr] = retain( cbr, solved_case )

emotion = solved_case.solution;
cluster = cbr.clusters{emotion};

l = cluster.n;
for i = 1 : l
    this_sim = compute_similarity_cosine(solved_case, cluster(i));
    cluster(i).average_sim = (cluster(i).average_sim*(l-1)+this_sim)/l;
    solved_case.average_sim = solved_case.average_sim + this_sim;
end
solved_case.average_sim = solved_case.average_sim/l;
cluster = [ cluster; solved_case ];
cluster.n = l+1;

cluster = remove_duplicate_cases(cluster);
cluster = case_sort(cluster);

cbr.clusters{emotion} = cluster;
end