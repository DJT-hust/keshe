function cost = get_link_cost(path_link, seismic_situation, rews, M)
    cost = 0;
    N = size(path_link, 2);

    for i = 1:N

        if isempty(intersect(find(seismic_situation), path_link{i}))
            cost = rews(i);
            break;
        end

    end

    if cost == 0
        cost = M;
    end
