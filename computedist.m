clear
clc
close all

load netdata_AsianPart_8nodes.mat
load ge_8node_lowM.mat

res=[1	0	0	0	0	1	0	0	0;
1	0	1	0	0	1	0	0	0;
1	0	1	0	0	1	0	0	1;
1	0	1	0	0	1	1	0	1;
1	0	1	0	1	1	0	0	0;
1	0	1	0	1	1	0	0	1;
1	0	1	0	1	1	1	0	1
];

dist_list=[];
[seismic_situation,prob]=get_all_9links(linkData(:,6));

for i=1:size(res,1)
    i
    tic
%     if mod(i,2)==1
        dist=compute_exp_distance(res(i,:),31,net_length,[2 1],[4 7],[4 4],seismic_situation,prob,linkData);
%     else
dist_list=[dist_list {dist}];
        dist=compute_exp_distance(res(i,:),120,net_length,[2 1],[4 7],[4 4],seismic_situation,prob,linkData);
%     end
    dist_list=[dist_list {dist}];
    toc
end