function R = seed_node_influence_rank(rec,N,p)
%In this function we calculate the node influence and provide the rankings.
%The influence of a node n is measured by the time it takes to infect a
%p percentage of all nodes when n is a seed node.
%
%Input: 
%    rec: the infection data of the temporal network, data on row i 
%         indicates the infection record of node i as the seed node at each
%         time stamp.
%    N:   Total node number in the temporal network.
%    p:   percentage of infection
%Output:
%    R:   A N-by-2 matrix, the first column records the rankings of the
%         nodes, the second column records the time which these nodes
%         reaches the threshold. If the time exceeds the total time, this
%         means that the node doesn't reach the threshold by the end of the
%         time. Those nodes are compared by the numbers of nodes they
%         infected at the end of the process.(However we don't output the
%         number of infected nodes at the end.)

threshold = N*p;
s = size(rec);
time = zeros(s(1),1);
for i = 1:s(1)
    index = find(rec(i,:) >= threshold);
    if isempty(index) == 0
        time(i) = index(1);
    else
        time(i) = s(2)*2;
    end
end

[B,I] = sort(time);
R = [I,B];

weak_ind = B>s(2);
if isempty(weak_ind) == 0
    weak_nodes = I(weak_ind);
    final_infection_number = rec(weak_nodes,end);
    [~,I2] = sort(final_infection_number);
    weak_nodes_ranked = weak_nodes(I2);
    R(end-length(weak_nodes)+1:end,1) = weak_nodes_ranked; 
end

end