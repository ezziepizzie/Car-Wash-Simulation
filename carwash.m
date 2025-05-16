function carwash()
    
    rng_type = input('Choose RNG type (1 for LCG, 2 for default rand): ');
    fprintf('\n');
    
    % Seed the RNG
    if rng_type == 1
        seed = rand() * 1e9;
        rng = @(x) mod(1664525 * x + 1013904223, 2^32) / 2^32;
    else
        seed = rand();
        rng = @rand;
    end

    %=====  Prepare Service Table #1 (contain pdf, cdf, range of RN)
    pdf_S1(1:4) = 0.25;  %assign all pdf =0.25 ?
    cdf_S1(1)=pdf_S1(1);
    range_S1(1) = cdf_S1(1)*100;
    for i=2:4
        cdf_S1(i) = cdf_S1(i-1) + pdf_S1(i);
        range_S1(i) = cdf_S1(i)*100;
    end
    
    %=====  Prepare Service Table #2 (contain pdf, cdf, range of RN)
    pdf_S2(1:4) = 0.25; %assign all pdf =0.25 ?
    cdf_S2(1)=pdf_S2(1);
    range_S2(1) = cdf_S2(1)*100;
    for i=2:4
        cdf_S2(i) = cdf_S2(i-1) + pdf_S2(i);
        range_S2(i) = cdf_S2(i)*100;
    end 

    %=====  Prepare Service Table #3 (contain pdf, cdf, range of RN)
    pdf_S3(1:4) = 0.25;  %assign all pdf =0.25 ?
    cdf_S3(1)=pdf_S3(1);
    range_S3(1) = cdf_S3(1)*100;
    for i=2:4
        cdf_S3(i) = cdf_S3(i-1) + pdf_S3(i);
        range_S3(i) = cdf_S3(i)*100;
    end    
    
    %-- PRINT Service1 table
    fprintf('Table: Service Time for Wash Bay 1\n');
    print_serviceTable(pdf_S1,cdf_S1, range_S1); 
    
    %-- PRINT Service2 table
    fprintf('Table: Service Time for Wash Bay 2\n');
    print_serviceTable(pdf_S2,cdf_S2, range_S2); 
    
    %-- PRINT Service3 table
    fprintf('Table: Service Time for Wash Bay 3\n');
    print_serviceTable(pdf_S3,cdf_S3, range_S3);
    
    %=====  Prepare Inter-arrival Table (contain pdf, cdf, range of RN)  
    pdf_inter_arr(1:5) = 0.2;  %assign all prob dist equal =0.2
    pdf_inter_arr(2) = 0.4;
    pdf_inter_arr(3) = 0.1;
    pdf_inter_arr(4) = 0.1;
    
    cdf_inter_arr(1) = pdf_inter_arr(1);
    range_inter_arr(1) = cdf_inter_arr(1)*100;
    for i=2:5
        cdf_inter_arr(i)=cdf_inter_arr(i-1) + pdf_inter_arr(i);
        range_inter_arr(i) = cdf_inter_arr(i)*100;
    end 
    
    %-- PRINT inter-arrival table
    print_interArrTable(pdf_inter_arr,cdf_inter_arr, range_inter_arr);   
    
    num_cars = input('Enter the number of cars: ');
    fprintf('\n');
    
    %===== RN for Inter-arrival customers ===== 
    i_a = rand(1,num_cars-1);
    inter_arr_RN = floor(1+(100-1)*(i_a));
    
    %--- RN for Service time customers
    s = rand(1,num_cars);
    service_RN = floor(1+(100-1)*(s));
    
    
    fprintf('Random Numbers for Inter-Arrival Time:   ');
    disp(inter_arr_RN);
    
    fprintf('Random Numbers for Service Time      :   ');
    disp(service_RN);
    
    
    
    %===== Queue rule: how assign ncustomers to k_stations')?
    %===== 
    
    queue(rng_type, seed, rng, range_inter_arr, inter_arr_RN, num_cars)