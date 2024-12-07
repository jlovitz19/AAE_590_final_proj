function [x_k_km1, P_k_km1] = EKF_predict(x_km1_km1, P_km1_km1, k)
    % Performs the prediction step of the Extended Kalman Filter
    %
    % Parameters:
    % x_km1_km1: state at previous time step 
    % P_km1_km1: state covariance at previous step
    % k: current time step
    %
    % Outputs:
    % x_k_km1: a preori state estimate at current time step
    % P_km1_km1: a preori state covariance at current time step

    % ode shenanigans
    tint = k - 1:k;
    opts = odeset("RelTol", 1e-3, "AbsTol", 1e-6);
    f = @(t, x) EoMs(x);
    
    % state prediction
    [t, x_k_km1] = ode45(f, tint, x_km1_km1, opts);
    x_k_km1 = x_k_km1(end, :);
    
    % covariance
    F_k = dynamics_jacobian(x_km1_km1);
    F_k = reshape(F_k, 6, 6);
    P_k_km1 = F_k*P_km1_km1*F_k.' + diag([10, 10, 0.01^2, 0.0001^2, 0.01^2, 0.001^2]);
end
