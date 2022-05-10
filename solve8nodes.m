clear;
clc

load netdata_AsianPart_8nodes.mat

[seismic_situation,prob]=get_all_9links(linkData(:,6));
all_investment=get_all_investment(linkData(:,5),0.5*sum(linkData(:,5)));
node1_list=[2 1];
node2_list=[4 7];
k=[4 4];
path_list = [];
rew_list = [];
info_list = [[]; []; []];
for i = 1:length(k)
    [path_node, rew] = kShortestPath(net_length,node1_list(i),node2_list(i),k(i));
    len_path = size(path_node, 2);
    path_link = [];

    for t = 1:len_path
        path_link_temp = path_convert_to_link(path_node{t}, linkData);
        path_link = [path_link, {path_link_temp}];
    end

    info_list = [info_list [len_path; node1_list(i); node2_list(i)]];
    path_list = [path_list path_link];
    rew_list = [rew_list rew];
end

N_investment=size(all_investment,2);
N_seismic_situation=size(seismic_situation,2);
flag=0;
M=31;
res_list=[];
for i=1:N_investment
    link_investment=find(all_investment(:,i));
    seismic_situation_new=seismic_situation;
    if link_investment
        seismic_situation_new(link_investment,:)=zeros(size(link_investment,1),512);
    end
    temp=0;
    for t=1:N_seismic_situation
        for index=1:length(k)
            [s,e]=get_index(info_list,node1_list(index),node2_list(index));
            cost_seismic_situation=get_link_cost(path_list(s:e),seismic_situation(:,t),rew_list(s:e),M);
            cost_seismic_situation_new=get_link_cost(path_list(s:e),seismic_situation_new(:,t),rew_list(s:e),M);
            temp=temp+(cost_seismic_situation-cost_seismic_situation_new)*prob(t);
        end
    end
    res_list=[res_list temp];
end

best_res=all_investment(:,find(res_list==max(res_list)))
