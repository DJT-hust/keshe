% net_length=zeros(25,25);
net_length=[];
% nodes=[15	17	18	19	20	21	22	23];
for i=1:9
%     if ismember(linkData(i,2),nodes) && ismember(linkData(i,3),nodes)
        net_length(linkData(i,2),linkData(i,3))=linkData(i,4);
        net_length(linkData(i,3),linkData(i,2))=linkData(i,4);
%     end
end

for i=1:8
    for j=1:8
        if net_length(i,j)==0
            net_length(i,j)=inf;
        end
    end
end
for i=1:8
    net_length(i,i)=0;
end