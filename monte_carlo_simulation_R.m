function [v_k, R_k_hat] = monte_carlo_simulation_R()
    % Performs Monte Carlo simulation to find the 
    % measurement covariance matrix
    %
    % Parameters: none
    %
    % Outputs:
    % v_k: Gaussian distributed measurement noise
    % P_k_hat: a (supposedly) good estimate for 
    % measurement covariance matrix

    N = 10;

    sum_noise = zeros(6, 6);

    for i = 1:N
        x0 = [389; 2.4; 0.056; 0.002; 0.022; 0.001]; 
        v_k = [8*randn(1); 0.2*randn(1); 0.005*randn(1); 0.0002*randn(1); 0.0022*randn(1); 0.0001*randn(1)]; 

        [~, ~, y_k] = monte_sim_sample(v_k, x0);

        sum_noise = sum_noise + y_k*y_k.';
    end

    % find p_k_hat
    R_k_hat = 1/N*sum_noise;
    disp(R_k_hat)
end
