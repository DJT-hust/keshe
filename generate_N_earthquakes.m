function res=generate_N_earthquakes(linkdata,NE)
    RandStream.setGlobalStream(RandStream('mt19937ar', 'Seed', sum(100 * clock)));
    NL=size(linkdata,1);
    res=zeros(NL,NE);
    for t=1:NE
        temp=rand(NL,1);
        prob=linkdata(:,6);
        res(:,t)= temp>prob;
    end