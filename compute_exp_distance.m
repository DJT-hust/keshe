function dist_list=compute_exp_distance(invest,M,net,node1_list,node2_list,k,seismic_situation,prob,linkData)
path_list = [];
rew_list = [];
info_list = [[]; []; []];
for i = 1:length(k)
    [path_node, rew] = kShortestPath(net,node1_list(i),node2_list(i),k(i));
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

link_investment=find(invest);
seismic_situation_new=seismic_situation;
N_seismic_situation=size(seismic_situation,2);
seismic_situation_new(link_investment,:)=zeros(size(link_investment,2),N_seismic_situation);
dist_list=[];
for index=1:length(k)
    temp=0;
    for t=1:N_seismic_situation
        [s,e]=get_index(info_list,node1_list(index),node2_list(index));
        cost_seismic_situation_new=get_link_cost(path_list(s:e),seismic_situation_new(:,t),rew_list(s:e),M);
        temp=temp+cost_seismic_situation_new*prob(t);
    end
    dist_list=[dist_list temp];
end