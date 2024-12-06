clc, close, clear all
syms x1 x2 x3 x4 x5 x6 x2_d_sym x4_d_sym x6_d_sym;

[e_r, e_r_d, ~] = calc_direction_vector(x3, x5, x4, x6);

% second derivative of e_r
e_r_dd_1 = -cos(x5)*sin(x3)*x6^2-cos(x3)*sin(x5)*x6*x4-...
    sin(x3)*sin(x5)*x6*x4+cos(x3)*cos(x5)*x4^2 -...
    sin(x5)*sin(x3)*x6_d_sym + cos(x5)*cos(x3)*x4_d_sym;
e_r_dd_2 = -cos(x3)*cos(x5)*x6^2+2*sin(x3)*sin(x5)*x4*x6-...
    cos(x5)*cos(x3)*x4^2 - sin(x5)*cos(x3)*x6_d_sym -...
    cos(x5)*sin(x3)*x4_d_sym;
e_r_dd_3 = -sin(x5)*x6^2 + cos(x5)*x6_d_sym;

% solving for easy to solve state derivatives
x1_d_sym = x2;
x3_d_sym = x4;
x5_d_sym = x6;

% solving for hard to solve state derivatives

x2_d = -(x1*x6^2 + x1*x4^2*cos(x5) + 2*x2*x4*cos(x3)*cos(x5) - x2*x6*cos(x3)*cos(x5) + 2*x2*x4*cos(x5)*sin(x3) - x1*x4^2*cos(x3)^2*cos(x5)^2 - x1*x6^2*cos(x3)^2*cos(x5)^2 - x1*x6^2*cos(x3)^2*sin(x5)^2 - x1*x6^2*cos(x5)^2*sin(x3)^2 - x1*x6^2*sin(x3)^2*sin(x5)^2 + x1*x4^2*sin(x3)*sin(x5) + x1*x4^2*cos(x5)^2*sin(x3) + 2*x2*x4*cos(x5)^2*sin(x3)^2 - x1*x4*x6*cos(x3)^2*sin(x5)^2 - x2*x4*cos(x3)*cos(x5)^2*sin(x3) + x1*x4^2*cos(x3)*cos(x5)*sin(x5) + 2*x2*x4*cos(x3)^2*cos(x5)*sin(x5) - 2*x1*x4*x6*sin(x3)^2*sin(x5)^2 + 3*x2*x4*cos(x5)*sin(x3)^2*sin(x5) - x2*x6*cos(x3)*sin(x3)*sin(x5)^2 - x2*x6*cos(x5)*sin(x3)^2*sin(x5) - x1*x4*x6*cos(x3)*sin(x5) - x1*x4*x6*sin(x3)*sin(x5) + x1*x4^2*cos(x3)*cos(x5)^2*sin(x3) + x1*x4^2*cos(x3)^2*cos(x5)*sin(x5) + x1*x4^2*cos(x3)*cos(x5)*sin(x3)*sin(x5) - x1*x4*x6*cos(x3)*sin(x3)*sin(x5)^2 - x1*x4*x6*cos(x5)*sin(x3)^2*sin(x5) + 2*x2*x4*cos(x3)*cos(x5)*sin(x3)*sin(x5) + x1*x4*x6*cos(x3)*cos(x5)*sin(x3)*sin(x5))/(cos(x3)^2*cos(x5)^2 + cos(x3)^2*sin(x5)^2 + cos(x3)*sin(x5) + cos(x5)^2*sin(x3)^2 + cos(x5)*sin(x3) + sin(x3)^2*sin(x5)^2);
x4_d = -(x1*x6^2*sin(x5) + x1*x4^2*cos(x3)^2*cos(x5)^3 - 2*x2*x4*cos(x5)^2*sin(x3) + x1*x4^2*cos(x5)*sin(x5) + x2*x6*cos(x5)^2*sin(x3) + x1*x4^2*cos(x3)*cos(x5)^3 + x1*x6^2*cos(x3)*cos(x5)^2 + x1*x4^2*cos(x5)^2*sin(x3) + x1*x6^2*cos(x3)*sin(x5)^2 + x2*x4*cos(x5)^3*sin(x3)^2 + x1*x4^2*sin(x3)*sin(x5)^2 + 2*x2*x4*cos(x5)*sin(x3)*sin(x5) + x1*x4^2*cos(x3)^2*cos(x5)*sin(x5)^2 - x1*x4*x6*cos(x3)^2*sin(x5)^3 + x1*x4^2*cos(x3)*cos(x5)*sin(x5) + 2*x2*x4*cos(x3)*cos(x5)^3*sin(x3) - 2*x1*x4*x6*sin(x3)^2*sin(x5)^3 - x2*x6*cos(x3)*sin(x3)*sin(x5)^3 + x1*x4^2*cos(x3)*cos(x5)^3*sin(x3) + x1*x4^2*cos(x3)*cos(x5)*sin(x5)^2 + x2*x4*cos(x5)*sin(x3)^2*sin(x5)^2 - x1*x4*x6*cos(x3)*sin(x5)^2 - x1*x4*x6*sin(x3)*sin(x5)^2 - x1*x4*x6*cos(x3)^2*cos(x5)^2*sin(x5) - 2*x1*x4*x6*cos(x5)^2*sin(x3)^2*sin(x5) + 2*x2*x4*cos(x3)*cos(x5)*sin(x3)*sin(x5)^2 - x2*x6*cos(x3)*cos(x5)^2*sin(x3)*sin(x5) + x1*x4^2*cos(x3)*cos(x5)*sin(x3)*sin(x5)^2 - x1*x4*x6*cos(x3)*sin(x3)*sin(x5)^3 - x1*x4*x6*cos(x3)*cos(x5)^2*sin(x3)*sin(x5))/(x1*cos(x5)*(cos(x3)^2*cos(x5)^2 + cos(x3)^2*sin(x5)^2 + cos(x3)*sin(x5) + cos(x5)^2*sin(x3)^2 + cos(x5)*sin(x3) + sin(x3)^2*sin(x5)^2));
x6_d = -(2*x2*x6*cos(x3)*sin(x5) + 2*x2*x6*cos(x5)*sin(x3) + x1*x4^2*cos(x3)^2*cos(x5)^2 + x1*x6^2*cos(x3)*cos(x5) + x1*x4^2*cos(x3)*sin(x5) + x1*x4^2*cos(x5)*sin(x3) - x1*x6^2*sin(x3)*sin(x5) + x1*x4^2*cos(x3)*cos(x5)^2 + 2*x2*x4*cos(x3)^2*cos(x5)^2 + x2*x6*cos(x3)^2*cos(x5)^2 + 3*x2*x4*cos(x5)^2*sin(x3)^2 + x2*x6*cos(x3)^2*sin(x5)^2 + x2*x6*cos(x5)^2*sin(x3)^2 + 2*x2*x6*sin(x3)^2*sin(x5)^2 + 2*x2*x4*cos(x3)*cos(x5)^2*sin(x3) + x1*x4*x6*sin(x3)^2*sin(x5)^2 - x1*x4^2*cos(x5)*sin(x3)*sin(x5) - 2*x2*x4*cos(x5)*sin(x3)^2*sin(x5) + x1*x4^2*cos(x3)*cos(x5)^2*sin(x3) + x1*x4^2*cos(x3)^2*cos(x5)*sin(x5) - x1*x4^2*cos(x3)*cos(x5)*sin(x3)*sin(x5) - x1*x4*x6*cos(x3)^2*cos(x5)*sin(x5) - x1*x4*x6*cos(x3)*sin(x3)*sin(x5)^2 - 2*x1*x4*x6*cos(x5)*sin(x3)^2*sin(x5) + x2*x4*cos(x3)*cos(x5)*sin(x3)*sin(x5) - x2*x6*cos(x3)*cos(x5)*sin(x3)*sin(x5) - x1*x4*x6*cos(x3)*cos(x5)*sin(x3)*sin(x5))/(x1*(cos(x3)^2*cos(x5)^2 + cos(x3)^2*sin(x5)^2 + cos(x3)*sin(x5) + cos(x5)^2*sin(x3)^2 + cos(x5)*sin(x3) + sin(x3)^2*sin(x5)^2));


symbolic_jacobian = jacobian([x1_d_sym, x2_d,...
    x3_d_sym, x4_d, x5_d_sym, x6_d], [x1, x2, x3, x4, x5, x6]);

disp(symbolic_jacobian);
