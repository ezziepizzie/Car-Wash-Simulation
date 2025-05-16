function print_simulationTable(rng_type, seed, rng, num_cars, inter_arrival_times, arrival_times, service_types)
    
    % Generate the overall simulation table
    fprintf('\nOverall Simulation Table:\n');
    fprintf('--------------------------------------------------------------------------------------\n');
    fprintf('| n | RN for Inter-arrival time | Inter-arrival time |  Arrival time  | Service type |\n');
    fprintf('--------------------------------------------------------------------------------------\n');
    for i = 1:num_cars
        if rng_type == 1
            rn = rng(seed);
            seed = rng(seed) * 1e9;
        else
            rn = rng();
        end
        fprintf('| %-2d|        %-14.6f     |        %-7d     |      %-6d    |      %-12d     \n', i, rn, inter_arrival_times(i), arrival_times(i), service_types(i));
    end
    fprintf('--------------------------------------------------------------------------------------\n');

   