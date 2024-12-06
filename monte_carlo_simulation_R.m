function R_k_hat = monte_carlo_simulation_R()
    N = 10;

    sum_noise = zeros(4, 4);

    for i = 1:N
        x0 = [389; 2.4; 0.056; 0.002; 0.022; 0.001]; % + dot([sqrt(sqrt(389)); sqrt(sqrt(2.4)); sqrt(sqrt(0.056)); sqrt(sqrt(0.002)); sqrt(sqrt(0.022)); sqrt(sqrt(0.001))], randn(6, 1));
        v_k = [1e-2; 1e-8; 0.2; 0.3] + sqrt(0.04)*randn(4, 1);
        w_k = [1e-4; 2e-4; 1e-5; 1e-4; 1e-4; 2e-4]  + sqrt(0.008)*randn(6, 1);

        [~, ~, y_k] = monte_sim_sample(v_k, x0);

        %y_N(:, i) = y_k;
        disp(y_k*y_k.');

        sum_noise = sum_noise + y_k*y_k.';
    end

    % find p_k_hat
    R_k_hat = 1/N*sum_noise;
    disp(R_k_hat)
end
