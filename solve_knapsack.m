function [res,info] = solve_knapsack(ce,import_value,B)
    
    N=size(ce,1);
    f=import_value;%ce为1*N
    Aineq = ce';
    bineq=B;
    ctype = 'B';

    for i = 2:N
        ctype = strcat(ctype, 'B');
    end
    lb = zeros(N, 1);
    ub = ones(N, 1);
    options = cplexoptimset;
    options.Display = 'off';
    [res, info] = cplexmilp(f, Aineq, bineq, [], [], [], [], [], lb, ub, ctype, [], options);
    
end