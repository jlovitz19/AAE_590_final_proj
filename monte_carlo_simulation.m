function P_k_hat = monte_carlo_simulation()
    % Performs Monte Carlo simulation to find the covariance matrix
    %
    % Parameters: none
    %
    % Outputs:
    % P_k_hat: a (supposedly) good estimate for covariance matrix
    
    N = 10;

    P_N = NaN(6, 6, N);
    e_N = NaN(6, N);
    sum = zeros(6, 6);

    for i = 1:N
        x0 = [389*rand(1); 2.4*rand(1); 0.056*rand(1); 0.002*rand(1); 0.022*rand(1); 0.001*rand(1)];
        v_k = [8*randn(1); 0.2*randn(1); 0.005*randn(1); 0.0002*randn(1); 0.0022*randn(1); 0.0001*randn(1)]; 

        [e_k, P_k, ~] = monte_sim_sample(v_k, x0);

        e_N(:, i) = e_k;
        P_N(:, :, i) = P_k;

        sum = sum + e_N(:, i)*e_N(:, i).';
    end
    
   
    % find p_k_hat
    P_k_hat = 1/N*sum;

    
    sum = 0;
    for i = 1:N
        rho_k = e_N(:, i).'*inv(P_N(:, :, i))*e_N(:, i)/(e_N(:, i).'*inv(P_k_hat)*e_N(:, i));
        sum = sum + log10(rho_k);
    end
    nu_k = 10/N*sum;
end
