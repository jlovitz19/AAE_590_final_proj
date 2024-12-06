clc, clear, close all;

% define initial states
x0_true = [4000.0 20.4 0.056 0.004 0.022 0.08].';

% first find the true state

% singularity avoidance
if x0_true(3) == 0
    x0_true(3) = 1e-10;
end

tint = 0:500;
opts = odeset("RelTol", 1e-3, "AbsTol", 1e-6);
f = @(t_true, x_true) EoMs(x_true);
[t_true, x_true] = ode45(f, tint, x0_true, opts);

x_true = x_true.';
% get true measurement
z_k = calc_measurement(x_true);

% now prepare for kalman filter

% monte carlo to find initial state

x0_hat = [400 2 0.048 0.0019 0.027 0.0022].';
P0 = monte_carlo_simulation(); 

R_k = 0;

x_k = NaN(6, length(x_true(1, :)));
P_k = NaN(6, 6, length(x_true(1, :)));

x_k(:, 1) = x0_hat;
P_k(:, :, 1) = P0;

% implementing EKF
for k = 2:length(x_true(1, :))
    disp(k)

    % prediction step
    [x_k_km1, P_k_km1] = EKF_predict(x_k(:, k - 1), P_k(:, :, k - 1), k);

    disp(x_k_km1);

    % update step
    [x_k_k, P_k_k, y_k] = EKF_update(x_k_km1.', P_k_km1, z_k(:, k), R_k); % z_k(:, k)

    x_k(:, k) = x_k_k;
    P_k(:, :, k) = P_k_k;
end

% retrieving state parameters
r_est = x_k(1, :);
az_est = x_k(3, :);
alt_est = x_k(5, :);

r_true = x_true(1, :);
az_true = x_true(3, :);
alt_true = x_true(5, :);

% coordinate transform
q_est = r_est.*cos(alt_est).*sin(az_est);
y_est = r_est.*cos(alt_est).*cos(az_est);
z_est = r_est.*sin(alt_est);

q_true = r_true.*cos(alt_true).*sin(az_true);
y_true = r_true.*cos(alt_true).*cos(az_true);
z_true = r_true.*sin(alt_true);

% sigma bounds
error = x_true - x_k;

sig3_1 = NaN(1, length(x_k(1, :)));
sig3_2 = NaN(1, length(x_k(1, :)));
sig3_3 = NaN(1, length(x_k(1, :)));
sig3_4 = NaN(1, length(x_k(1, :)));
sig3_5 = NaN(1, length(x_k(1, :)));
sig3_6 = NaN(1, length(x_k(1, :)));

for i = 1:length(x_k(1, :))
    sig3_1(i) = 3*sqrt(P_k(1, 1, i));
    sig3_2(i) = 3*sqrt(P_k(2, 2, i));
    sig3_3(i) = 3*sqrt(P_k(3, 3, i));
    sig3_4(i) = 3*sqrt(P_k(4, 4, i));
    sig3_5(i) = 3*sqrt(P_k(5, 5, i));
    sig3_6(i) = 3*sqrt(P_k(6, 6, i));
end

% plot the pain
figure(1), plot3(q_est, y_est, z_est, "b*");
hold on, plot3(q_true, y_true, z_true, "k");
hold on, plot3(0, 0, 0, '-s','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor', [1 .6 .6]);
legend("estimated", "true", "EWR");
grid on;
%{
xlim([0 40]);
ylim([200 600]);
zlim([0 16]);
%}
hold off;


figure(2);
subplot(3, 2, 1), plot(t_true, error(1, :), "m");
hold on, plot(t_true, sig3_1, "b");
hold on, plot(t_true, -sig3_1, "b");
ylim([-0.1 0.1]);
grid on, legend("error", "3\sigma bounds");
subplot(3, 2, 2), plot(t_true, error(2, :), "m");
hold on, plot(t_true, sig3_2, "b");
hold on, plot(t_true, -sig3_2, "b");
ylim([-0.1 0.1]);
grid on;
subplot(3, 2, 3), plot(t_true, error(3, :), "m");
hold on, plot(t_true, sig3_3, "b");
hold on, plot(t_true, -sig3_3, "b");
ylim([-0.1 0.1]);
grid on;
subplot(3, 2, 4), plot(t_true, error(4, :), "m");
hold on, plot(t_true, sig3_4, "b");
hold on, plot(t_true, -sig3_4, "b");
ylim([-0.1 0.1]);
grid on;
subplot(3, 2, 5), plot(t_true, error(5, :), "m");
hold on, plot(t_true, sig3_5, "b");
hold on, plot(t_true, -sig3_5, "b");
ylim([-0.1 0.1]);
grid on;
subplot(3, 2, 6), plot(t_true, error(6, :), "m");
hold on, plot(t_true, sig3_6, "b");
hold on, plot(t_true, -sig3_6, "b");
ylim([-0.1 0.1]);
grid on;
hold off;
