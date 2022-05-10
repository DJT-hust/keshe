function res=multi_set_union(set_list)

N=size(set_list,2);
res=set_list{1};
for i=2:N
    res=union(res,set_list{i});
end
