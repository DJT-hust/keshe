clear
clc
close all

load netdata_25nodes.mat
load 25node_4od_ge_lowM_n.mat

res=[1	0	0	0	0	1	0	0	0;
1	0	0	0	0	1	0	0	0;
1	0	0	0	0	1	0	0	0;
1	0	1	0	0	1	0	0	0;
1	0	1	0	0	1	0	0	0;
1	0	1	0	0	1	0	0	0;
1	0	1	0	0	1	1	0	1;
1	0	1	0	0	1	1	0	1;
1	0	1	0	0	1	0	0	1;
1	0	1	0	0	1	1	0	1;
1	0	1	0	1	1	0	0	0;
1	0	1	0	1	1	0	0	0;
1	0	1	0	1	1	0	0	0;
1	0	1	0	1	1	1	0	1;
1	0	1	0	1	1	1	0	1;
1	0	1	0	1	1	0	0	1;
1	0	1	0	1	1	1	0	1
];
dist_list=[];
for i=1:size(res,1)
    i
    tic
    dist=compute_exp_distance(res(i,:),31,net_length,[1 6 13 5],[21 25 21 17],[4 4 4 4],seismic_situation,1/NE*ones(1000000,1),linkData);
    dist_list=[dist_list {dist}];
    toc
end