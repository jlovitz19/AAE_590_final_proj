clc, close, clear all;

syms x1 x2 x3 x4 x5 x6 x2_d x4_d x6_d;

% direction vector
[e_r, e_r_d, e_r_dd] = calc_direction_vector(x3, x5, x4, x6);

e_r_dd_1 = -cos(x5)*sin(x3)*x6^2-cos(x3)*sin(x5)*x6*x4-...
    sin(x3)*sin(x5)*x6*x4+cos(x3)*cos(x5)*x4^2 -...
    sin(x5)*sin(x3)*x6_d + cos(x5)*cos(x3)*x4_d;
e_r_dd_2 = -cos(x3)*cos(x5)*x6^2+2*sin(x3)*sin(x5)*x4*x6-...
    cos(x5)*cos(x3)*x4^2 - sin(x5)*cos(x3)*x6_d -...
    cos(x5)*sin(x3)*x4_d;
e_r_dd_3 = -sin(x5)*x6^2 + cos(x5)*x6_d;

v_t = abs(x2*e_r + x1*e_r_d);

eqn1 = x2_d*e_r(1) + 2*x2*e_r_d(1) + x1*e_r_dd(1) - v_t*e_r_d(1) == 0;
eqn2 = x2_d*e_r(2) + 2*x2*e_r_d(2) + x1*e_r_dd(2) - v_t*e_r_d(2) == 0;
eqn3 = x2_d*e_r(3) + 2*x2*e_r_d(3) + x1*e_r_dd(3) - v_t*e_r_d(3) == 0;

[x2_dot, x4_dot, x6_dot] = solve([eqn1, eqn2, eqn3], [x2_d, x4_d, x6_d]);
disp([x1_d; x2_dot; x3_d; x4_dot; x5_d; x6_dot]);

