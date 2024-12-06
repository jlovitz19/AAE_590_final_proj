function x_dot = EoMs(x)
    % Calculates the true state using dynamics
    %
    % Parameters:
    % x: state variable consisting of R, R_dot
    % az, az_dot, alt, and alt_dot
    %
    % Outputs:
    % x_dot: derivative of state variable
    
    % define states
    x1 = x(1); % R
    x2 = x(2); % R_dot
    x3 = x(3); % az
    x4 = x(4); % az_dot
    x5 = x(5); % alt
    x6 = x(6); % alt_dot
    
    x_d = [x2;...
        -(x1*x6^2 + x1*x4^2*cos(x5) + 2*x2*x4*cos(x3)*cos(x5) - x2*x6*cos(x3)*cos(x5) + 2*x2*x4*cos(x5)*sin(x3) - x1*x4^2*cos(x3)^2*cos(x5)^2 - x1*x6^2*cos(x3)^2*cos(x5)^2 - x1*x6^2*cos(x3)^2*sin(x5)^2 - x1*x6^2*cos(x5)^2*sin(x3)^2 - x1*x6^2*sin(x3)^2*sin(x5)^2 + x1*x4^2*sin(x3)*sin(x5) + x1*x4^2*cos(x5)^2*sin(x3) + 2*x2*x4*cos(x5)^2*sin(x3)^2 - x1*x4*x6*cos(x3)^2*sin(x5)^2 - x2*x4*cos(x3)*cos(x5)^2*sin(x3) + x1*x4^2*cos(x3)*cos(x5)*sin(x5) + 2*x2*x4*cos(x3)^2*cos(x5)*sin(x5) - 2*x1*x4*x6*sin(x3)^2*sin(x5)^2 + 3*x2*x4*cos(x5)*sin(x3)^2*sin(x5) - x2*x6*cos(x3)*sin(x3)*sin(x5)^2 - x2*x6*cos(x5)*sin(x3)^2*sin(x5) - x1*x4*x6*cos(x3)*sin(x5) - x1*x4*x6*sin(x3)*sin(x5) + x1*x4^2*cos(x3)*cos(x5)^2*sin(x3) + x1*x4^2*cos(x3)^2*cos(x5)*sin(x5) + x1*x4^2*cos(x3)*cos(x5)*sin(x3)*sin(x5) - x1*x4*x6*cos(x3)*sin(x3)*sin(x5)^2 - x1*x4*x6*cos(x5)*sin(x3)^2*sin(x5) + 2*x2*x4*cos(x3)*cos(x5)*sin(x3)*sin(x5) + x1*x4*x6*cos(x3)*cos(x5)*sin(x3)*sin(x5))/(cos(x3)^2*cos(x5)^2 + cos(x3)^2*sin(x5)^2 + cos(x3)*sin(x5) + cos(x5)^2*sin(x3)^2 + cos(x5)*sin(x3) + sin(x3)^2*sin(x5)^2);...
        x4;...
        -(x1*x6^2*sin(x5) + x1*x4^2*cos(x3)^2*cos(x5)^3 - 2*x2*x4*cos(x5)^2*sin(x3) + x1*x4^2*cos(x5)*sin(x5) + x2*x6*cos(x5)^2*sin(x3) + x1*x4^2*cos(x3)*cos(x5)^3 + x1*x6^2*cos(x3)*cos(x5)^2 + x1*x4^2*cos(x5)^2*sin(x3) + x1*x6^2*cos(x3)*sin(x5)^2 + x2*x4*cos(x5)^3*sin(x3)^2 + x1*x4^2*sin(x3)*sin(x5)^2 + 2*x2*x4*cos(x5)*sin(x3)*sin(x5) + x1*x4^2*cos(x3)^2*cos(x5)*sin(x5)^2 - x1*x4*x6*cos(x3)^2*sin(x5)^3 + x1*x4^2*cos(x3)*cos(x5)*sin(x5) + 2*x2*x4*cos(x3)*cos(x5)^3*sin(x3) - 2*x1*x4*x6*sin(x3)^2*sin(x5)^3 - x2*x6*cos(x3)*sin(x3)*sin(x5)^3 + x1*x4^2*cos(x3)*cos(x5)^3*sin(x3) + x1*x4^2*cos(x3)*cos(x5)*sin(x5)^2 + x2*x4*cos(x5)*sin(x3)^2*sin(x5)^2 - x1*x4*x6*cos(x3)*sin(x5)^2 - x1*x4*x6*sin(x3)*sin(x5)^2 - x1*x4*x6*cos(x3)^2*cos(x5)^2*sin(x5) - 2*x1*x4*x6*cos(x5)^2*sin(x3)^2*sin(x5) + 2*x2*x4*cos(x3)*cos(x5)*sin(x3)*sin(x5)^2 - x2*x6*cos(x3)*cos(x5)^2*sin(x3)*sin(x5) + x1*x4^2*cos(x3)*cos(x5)*sin(x3)*sin(x5)^2 - x1*x4*x6*cos(x3)*sin(x3)*sin(x5)^3 - x1*x4*x6*cos(x3)*cos(x5)^2*sin(x3)*sin(x5))/(x1*cos(x5)*(cos(x3)^2*cos(x5)^2 + cos(x3)^2*sin(x5)^2 + cos(x3)*sin(x5) + cos(x5)^2*sin(x3)^2 + cos(x5)*sin(x3) + sin(x3)^2*sin(x5)^2));...
        x6;...
        -(2*x2*x6*cos(x3)*sin(x5) + 2*x2*x6*cos(x5)*sin(x3) + x1*x4^2*cos(x3)^2*cos(x5)^2 + x1*x6^2*cos(x3)*cos(x5) + x1*x4^2*cos(x3)*sin(x5) + x1*x4^2*cos(x5)*sin(x3) - x1*x6^2*sin(x3)*sin(x5) + x1*x4^2*cos(x3)*cos(x5)^2 + 2*x2*x4*cos(x3)^2*cos(x5)^2 + x2*x6*cos(x3)^2*cos(x5)^2 + 3*x2*x4*cos(x5)^2*sin(x3)^2 + x2*x6*cos(x3)^2*sin(x5)^2 + x2*x6*cos(x5)^2*sin(x3)^2 + 2*x2*x6*sin(x3)^2*sin(x5)^2 + 2*x2*x4*cos(x3)*cos(x5)^2*sin(x3) + x1*x4*x6*sin(x3)^2*sin(x5)^2 - x1*x4^2*cos(x5)*sin(x3)*sin(x5) - 2*x2*x4*cos(x5)*sin(x3)^2*sin(x5) + x1*x4^2*cos(x3)*cos(x5)^2*sin(x3) + x1*x4^2*cos(x3)^2*cos(x5)*sin(x5) - x1*x4^2*cos(x3)*cos(x5)*sin(x3)*sin(x5) - x1*x4*x6*cos(x3)^2*cos(x5)*sin(x5) - x1*x4*x6*cos(x3)*sin(x3)*sin(x5)^2 - 2*x1*x4*x6*cos(x5)*sin(x3)^2*sin(x5) + x2*x4*cos(x3)*cos(x5)*sin(x3)*sin(x5) - x2*x6*cos(x3)*cos(x5)*sin(x3)*sin(x5) - x1*x4*x6*cos(x3)*cos(x5)*sin(x3)*sin(x5))/(x1*(cos(x3)^2*cos(x5)^2 + cos(x3)^2*sin(x5)^2 + cos(x3)*sin(x5) + cos(x5)^2*sin(x3)^2 + cos(x5)*sin(x3) + sin(x3)^2*sin(x5)^2))];
    
    x_dot = x_d; 
end

