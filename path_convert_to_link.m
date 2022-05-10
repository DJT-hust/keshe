function link_res=path_convert_to_link(path,linkdata)
    
    % path:node1-node2-...-nodeN
    
    len=size(path,2);
    link_res=[];
    node1_list=linkdata(:,2);
    node2_list=linkdata(:,3);
    for i=1:len-1
        node1=path(i);
        node2=path(i+1);
        num=intersect(union(find(node1_list==node1), find(node2_list==node1)),union(find(node1_list==node2), find(node2_list==node2)));
        link_res=[link_res,num];
    end