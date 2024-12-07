function [x_k_k, P_k_k, y_k] = EKF_update(x_k_km1, P_k_km1, z_k, R_k)
    % Performs the prediction step of the Extended Kalman Filter
    %
    % Parameters:
    % x_km1_km1: state at previous time step 
    % P_km1_km1: state covariance at previous step
    % k: current time step
    % z_k: measurement over whole timelapse
    % v_k: 
    %
    % Outputs:
    % x_k_km1: a preori state estimate at current time step
    % P_km1_km1: a preori state covariance at current time step
    % y_k: measurement residual
    % R_k: measurement noise covariance


    % compute measurement residual
    H_k = calc_measurement_jacobian(x_k_km1);
    
    z_k_hat = H_k*x_k_km1(:, end);
    measurement_residual = z_k - z_k_hat; % measurement error

    % residual covariance and kalman gain
    S_k = H_k*P_k_km1*H_k.' + R_k; 
    K_k = P_k_km1*H_k.'*inv(S_k);

    % final estimations
    x_k_k = x_k_km1 + K_k*measurement_residual;
    P_k_k = (eye(length(K_k(:, 1))) - K_k*H_k)*P_k_km1;
    y_k = z_k - z_k_hat;
end

    
