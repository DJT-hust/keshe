function situation_res=get_all_investment(ce,B)

n=9;
Y1=dec2bin(0:2^n-1,n);
JG=[];
for i=1:9
    JG=[JG,str2num(Y1(:,i))];
end
situation=JG';

situation_res=[];
for i=1:512
    if ce'*situation(:,i)<=B
        situation_res=[situation_res,situation(:,i)];
    end
end