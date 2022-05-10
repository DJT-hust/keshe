function [start_index,end_index]=get_index(length_list,node1,node2)
    
    num=intersect(find(length_list(2,:)==node1),find(length_list(3,:)==node2));
    start_index=sum(length_list(1,1:num-1))+1;
    end_index=start_index+length_list(1,num)-1;