function compute_ge_8nodes(M,file)

load netdata_AsianPart_8nodes.mat

path_list = [];
rew_list = [];
info_list = [[]; []; []];
node1_list=[2 1];
node2_list=[4 7];
k=[4 4];

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

NE = 50000; %地震次数5*10^4
seismic_situation = generate_N_earthquakes(linkData, NE);
cost_seismic_situation_list = zeros(1, 9);
equ_list=zeros(1,NE);
for link=1:9
    link
    seismic_situation_new=seismic_situation;
    seismic_situation_new(link,:)=equ_list;
    tic
    for index = 1:length(k)
        [s,e]=get_index(info_list,node1_list(index),node2_list(index));
        set_union=multi_set_union(path_list(s:e));
        for t=1:NE
            if ismember(link,set_union)
                cost_seismic_situation=get_link_cost(path_list(s:e),seismic_situation(:,t),rew_list(s:e),M);
                cost_seismic_situation_new=get_link_cost(path_list(s:e),seismic_situation_new(:,t),rew_list(s:e),M);
                cost_seismic_situation_list(link)=cost_seismic_situation_list(link)+cost_seismic_situation_new-cost_seismic_situation;
            end
        end
    end
    toc
    cost_seismic_situation_list(link) = cost_seismic_situation_list(link) / NE;
end

save(file);

toc