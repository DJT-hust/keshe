function [situation,prob]=get_all_9links(linkSurvivalProb)

% https://www.ilovematlab.cn/thread-600493-1-1.html

    n=9;
Y1=dec2bin(0:2^n-1,n);
JG=[];
for i=1:9
    JG=[JG,str2num(Y1(:,i))];
end
situation=JG';

linkFailProb=ones(size(linkSurvivalProb))-linkSurvivalProb;
prob=ones(1,512);
for i=1:512
    for j=1:9
        if situation(j,i)==1
            prob(i)=prob(i)*linkFailProb(j);
        else
            prob(i)=prob(i)*linkSurvivalProb(j);
        end
    end
end
prob=prob/sum(prob);