function P_k_hat = monte_carlo_simulation()
    N = 10;

    P_N = NaN(6, 6, N);
    e_N = NaN(6, N);
    sum = zeros(6, 6);

    for i = 1:N
        x0 = [389; 2.4; 0.056; 0.002; 0.022; 0.001]; % + dot([sqrt(389); sqrt(2.4); sqrt(0.056); sqrt(0.002); sqrt(0.022); sqrt(0.001)], randn(6, 1));
        v_k = 1e-2 + sqrt(1e-2)*randn(4, 1); %[1e-2; 1e-8; 0.2; 0.3] + sqrt(0.04)*randn(4, 1);
        w_k = [1e-4; 2e-4; 1e-5; 1e-4; 1e-4; 2e-4]  + sqrt(0.008)*randn(6, 1);

        [e_k, P_k, ~] = monte_sim_sample(v_k, x0);

        e_N(:, i) = e_k;
        P_N(:, :, i) = P_k;

        sum = sum + e_N(:, i)*e_N(:, i).';
        disp("HOE");
    end

    % find p_k_hat
    P_k_hat = 1/N*sum;
end
