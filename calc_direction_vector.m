function [e_r, e_r_d, e_r_dd] = calc_direction_vector(az, alt, az_d, alt_d)
    % Calculates the direction vector between the radar and
    % the flying object and its 1st and 2nd derivatives
    %
    % Parameters:
    % az: azimuth (ground plane angle) (rad)
    % alt: altitude (angle between ground and lambda vector) (rad)
    % az_d: derivative of azimuth (rad/s)
    % alt_d: derivative of altitude (rad/s)
    %
    % Outputs:
    % e_r: direction vector between radar and object (unitless)
    % e_r_d: direction vector rate (/s)
    % e_r_dd: 2nd derivative of direction vector (/s^2)

    DCM = calc_rotation_matrix(az, alt);

    e_r = DCM(1, :).';

    e_r_d = [-sin(alt)*sin(az)*alt_d+cos(alt)*sin(az)*az_d;...
        -sin(alt)*cos(az)*alt_d-cos(alt)*sin(az)*az_d;...
        cos(alt)*alt_d];

    e_r_dd_1 = -cos(alt)*sin(az)*alt_d^2-cos(az)*sin(alt)*alt_d*az_d-...
        sin(az)*sin(alt)*alt_d*az_d+cos(az)*cos(alt)*az_d^2;
    e_r_dd_2 = -cos(az)*cos(alt)*alt^2+2*sin(az)*sin(alt)*az_d*alt_d-...
        cos(alt)*cos(az)*az_d^2;
    e_r_dd_3 = -sin(alt)*alt_d^2;

    e_r_dd = [e_r_dd_1; e_r_dd_2; e_r_dd_3];
end
