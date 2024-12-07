function DCM = calc_rotation_matrix(az, alt)
    % Calculates the rotation matrix given spherical 
    % angular parameters
    %
    % Parameters:
    % az: azimuth (ground plane angle) (rad)
    % alt: altitude (angle between ground and lambda vector) (rad)
    %
    % Output:
    % DCM: rotation matrix to drive inertial world frame
    % to radial body frame

    Rotation_1 = [cos(az) -sin(az) 0; sin(az) cos(az) 0; 0 0 1];
    Rotation_2 = [0 cos(alt) sin(alt); 0 -sin(alt) cos(alt); 1 0 0];

    DCM = Rotation_2*Rotation_1;
end

