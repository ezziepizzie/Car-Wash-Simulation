function queue(rng_type, seed, rng, range_inter_arr, inter_arr_RN, num_cars)    

    % Initialize variables
    arrival_times = zeros(num_cars, 1);
    service_types = zeros(num_cars, 1);
    inter_arrival_times = zeros(num_cars, 1);
    service_times = zeros(num_cars, 3);  % Each column for each wash bay

    % Assign inter-arrival times using predefined ranges and random numbers

    inter_arrival_times = assign_inter_arrival_times(range_inter_arr, inter_arr_RN, num_cars);


    % Generate random numbers for service types
    for i = 1:num_cars
        if rng_type == 1
            rn = rng(seed);
            seed = rng(seed) * 1e9;
        else
            rn = rng();
        end
        service_types(i) = generate_service_type(rn);
    end

    % Calculate arrival times
    arrival_times(1) = inter_arrival_times(1);
    for i = 2:num_cars
        arrival_times(i) = arrival_times(i-1) + inter_arrival_times(i);
    end

    % Initialize wash bays
    wash_bay = zeros(3, 1);  % Tracks end time for each wash bay

    % Simulate the car wash process
    for i = 1:num_cars
        [min_time, bay] = min(wash_bay);  % Find the first available bay
        if rng_type == 1
            rn = rng(seed);
            seed = rng(seed) * 1e9;
        else
            rn = rng();
        end
        service_time = generate_service_time(rn, bay);
        start_time = max(arrival_times(i), min_time);
        end_time = start_time + service_time;
        wash_bay(bay) = end_time;

        % Print events
        fprintf('Arrival of car %d at minute %d\n', i, arrival_times(i));
        if start_time > arrival_times(i)
            fprintf('Car %d waiting in queue\n', i);
        end
        fprintf('Service for car %d started at minute %d at wash bay %d\n', i, start_time, bay);
        fprintf('Car %d departed at minute %d from wash bay %d\n', i, end_time, bay);
        fprintf('\n')
        
        % Store the simulation data
        service_times(i, bay) = service_time;
    end

    % Generate the overall simulation table
    print_simulationTable(rng_type, seed, rng, num_cars, inter_arrival_times, arrival_times, service_types)

    % Generate the wash bay specific tables
    print_washbayTable(rng_type, seed, rng, num_cars, arrival_times, wash_bay, service_times)
    
    
    % Evaluate the results of the simulation
    evaluate_results(num_cars, arrival_times, wash_bay, service_times, inter_arrival_times)
end
