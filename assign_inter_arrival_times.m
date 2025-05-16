function inter_arrival_times = assign_inter_arrival_times(range_inter_arr, inter_arr_RN, num_cars)
    nIntArr = length(range_inter_arr);   
    inter_arrival_times = zeros(num_cars, 1);
    inter_arrival_times(1) = 0;  % For the 1st customer, there is no inter-arrival time

    for i = 1:num_cars-1
        if inter_arr_RN(i) <= range_inter_arr(1)
            inter_arrival_times(i+1) = 1;  % When t=1
        else       
            for j = 2:nIntArr                  
                if inter_arr_RN(i) > range_inter_arr(j-1) && inter_arr_RN(i) <= range_inter_arr(j)
                    inter_arrival_times(i+1) = j;
                    break;
                end
            end
        end
    end
end
