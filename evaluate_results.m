function evaluate_results(num_cars, arrival_times, wash_bay, service_times, inter_arrival_times)
    
    % Evaluate the results of the simulation
    waiting_times = zeros(num_cars, 1);
    time_spent_in_system = zeros(num_cars, 1);

    for i = 1:num_cars
        bay = find(service_times(i, :) > 0, 1);
        start_time = max(arrival_times(i), wash_bay(bay) - service_times(i, bay));
        end_time = wash_bay(bay);
        waiting_times(i) = max(0, start_time - arrival_times(i));
        time_spent_in_system(i) = end_time - arrival_times(i);
    end

    avg_waiting_time = mean(waiting_times);
    avg_inter_arrival_time = mean(inter_arrival_times);
    avg_arrival_time = mean(arrival_times);
    avg_time_spent = mean(time_spent_in_system);
    prob_wait_in_queue = sum(waiting_times > 0) / num_cars;
    avg_service_time = mean(service_times(service_times > 0));

    fprintf('\nEvaluation of Simulation Results:\n');
    fprintf('Average waiting time: %.2f minutes\n', avg_waiting_time);
    fprintf('Average inter-arrival time: %.2f minutes\n', avg_inter_arrival_time);
    fprintf('Average arrival time: %.2f minutes\n', avg_arrival_time);
    fprintf('Average time spent in system: %.2f minutes\n', avg_time_spent);
    fprintf('Probability of waiting in queue: %.2f\n', prob_wait_in_queue);
    fprintf('Average service time per wash bay: %.2f minutes\n', avg_service_time);
