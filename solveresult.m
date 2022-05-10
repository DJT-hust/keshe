clear
clc
load 25node_5od_ge_highM.mat

ce=linkData(:,5);
% ce=ce';
import_value=cost_seismic_situation_list;
for i=1:length(import_value)
    if import_value(i)>0
        import_value(i)=0;
    end
end
B=sum(linkData(:,5))*0.1;
[res,info] = solve_knapsack(ce,import_value,B);