function [e_k, P_k, y_k] = monte_sim_sample(v_k, x0)
    % Performs monte carlo simulations for iterative 
    % Monte Carlo algorithms
    %
    % Parameters:
    % v_k: sample measurement noise
    % w_k: sample process noise
    % x0: sample true ICs
    %
    % Outputs:
    % e_k: sample error
    % P_k: sample error covariance
    % y_k: sample measurement residual

    x0_true = x0;
    
    % first find the true state
    
    % singularity avoidance
    if x0_true(3) == 0
        x0_true(3) = 1e-10;
    end
    
    tint = 0:100;
    opts = odeset("RelTol", 1e-3, "AbsTol", 1e-6);
    f = @(t_true, x_true) EoMs(x_true);
    [~, x_true] = ode45(f, tint, x0_true, opts);
    
    x_true = x_true.';
    % get true measurement
    z_k = calc_measurement(x_true);
    
    % now prepare for kalman filter 
    x0_hat = [400 2 0.048 0.0019 0.027 0.0022].';
    P0 = diag([5 5 5 5 5 5]);
    
    x_k = NaN(6, length(x_true(1, :)));
    P_k = NaN(6, 6, length(x_true(1, :)));
    
    x_k(:, 1) = x0_hat;
    P_k(:, :, 1) = P0;
    R_k = ones([6, 6]);
    
    % implementing EKF
    for k = 2:length(x_true(1, :))
    
        % prediction step
        [x_k_km1, P_k_km1] = EKF_predict(x_k(:, k - 1), P_k(:, :, k - 1), k);
    
        % update step
        [x_k_k, P_k_k, y_k] = EKF_update(x_k_km1.', P_k_km1, z_k(:, k), R_k);
    
        x_k(:, k) = x_k_k;
        P_k(:, :, k) = P_k_k;
    end
    
    e_k = x_true - x_k;

    P_k = P_k(:, :, 1);
    e_k = e_k(:, 1);
    y_k = 1;
end
