function print_washbayTable(rng_type, seed, rng, num_cars, arrival_times, wash_bay, service_times)
    
    % Generate the wash bay specific tables
    for bay = 1:3
        fprintf('\nWash bay %d:\n', bay);
        fprintf('--------------------------------------------------------------------------------------------------------------------------\n');
        fprintf('| n | RN for service time | Service time | Time service begins | Time service ends | Waiting time | Time spent in system |\n');
        fprintf('--------------------------------------------------------------------------------------------------------------------------\n');
        for i = 1:num_cars
            if service_times(i, bay) > 0
                start_time = max(arrival_times(i), wash_bay(bay) - service_times(i, bay));
                end_time = wash_bay(bay);
                waiting_time = max(0, start_time - arrival_times(i));
                time_spent = end_time - arrival_times(i);
                if rng_type == 1
                    rn = rng(seed);
                    seed = rng(seed) * 1e9;
                else
                    rn = rng();
                end
                fprintf('| %-2d|      %-6.6f       |       %-5d  |         %-6d      |       %-6d      |      %-4d    |           %-6d     \n', i, rn, service_times(i, bay), start_time, end_time, waiting_time, time_spent);
            end
        end
        fprintf('--------------------------------------------------------------------------------------------------------------------------\n');
    end