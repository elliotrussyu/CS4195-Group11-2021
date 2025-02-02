function [hc,d] = hopcount(A,di)
%Given the adjacency matrix of the graph
%Find the average hopcount and the diameter of the network
    if nargin == 1
        di = 0;
    end
    
    G = graph(A);
    d_m = distances(G);
    hc = mean(d_m,'all');
    d = max(d_m,[],'all');

    if di == 1
        disp(['The average hopcount E[H] is ' num2str(hc)])
        disp(['The network diameter H_max is ' num2str(d)])
    end
end