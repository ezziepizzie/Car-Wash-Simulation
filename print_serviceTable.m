function print_serviceTable(prob, cdf, range)
    
    n=size(prob,2);
    
    fprintf('--------------------------------------------------------------------\n');
    fprintf('|  Service Time |    Probability    |    CDF    |      Range       |\n');
    fprintf('--------------------------------------------------------------------\n');
    
    for t=(1:n)
        if t==1
            fprintf('|     %d         |       %.3f      |    %.3f   |      1-%d    \n',t, prob(t), cdf(t), range(t));
        else
            fprintf('|     %d         |       %.3f      |    %.3f   |      %d-%d     \n',t, prob(t), cdf(t), range(t-1)+1, range(t));
        end
    end
    fprintf('--------------------------------------------------------------------\n\n');
    