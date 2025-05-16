function print_interArrTable(prob , cdf, range)
    
    n=size(prob,2);
    
    fprintf('Table: Inter-Arrival Time\n');
    fprintf('--------------------------------------------------------------------------------\n');
    fprintf('|     Inter-arrival Time     |  Probability,pdf |    CDF    |      Range       |\n');
    fprintf('--------------------------------------------------------------------------------\n');
    
    for t=1:n
        if t==1
            fprintf('|             %d              |       %.3f      |    %.3f   |      1-%d     \n',t, prob(t), cdf(t), range(t));        
        else
            fprintf('|             %d              |       %.3f      |    %.3f   |      %d-%d    \n',t, prob(t), cdf(t), range(t-1)+1, range(t));
        end
    end
    fprintf('--------------------------------------------------------------------------------\n\n');
    
    