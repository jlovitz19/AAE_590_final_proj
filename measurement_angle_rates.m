function [az, alt, az_d, alt_d] = measurement_angle_rates(R, R_d)
    % Turns phased-array radar measurements from distance
    % vector R to azimuth and altitude and its derivatives
    %
    % Parameters:
    % R: measured distance between EWR and target
    % R_d: measured derivative of distance between EWR and 
    % target
    %
    % Outputs:
    % az: azimuth (ground plane angle) (rad)
    % alt: altitude (angle between ground and lambda vector) (rad)
    % az_d: derivative of azimuth (rad/s)
    % alt_d: derivative of altitude (rad/s)

    % cartesian coordinates
    x = R(1);
    y = R(2);
    z = R(3);
    
    l = sqrt(x^2 + x^2); % vector component on ground plane

    % cartesian rates
    x_d = R_d(1);
    y_d = R_d(2);
    z_d = R_d(3);

    % angles found using geometry I set forth
    az = atan2(x/y);
    alt = atan2(z/l);

    % derivatives (found taking d/dt(az, alt) by hand
    az_d = (x_d/y - x*y_d/(y^2))/(1 + (x/y)^2);
    alt_d = z_d/sqrt(x^2 + y^2) -...
        z/((x^2 + y^2)^(3/2))*(x*y^2*x_d + y*x^2*y_d);
end

