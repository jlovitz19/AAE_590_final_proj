clc, clear, close all;

syms x1 x2 x3 x4 x5 x6 x1d x2d x3d x4d x5d x6d

q = x1*cos(x5)*sin(x3);
y = x1*cos(x5)*cos(x3);
z = x1*sin(x5);

q_d = x2*cos(x5)*sin(x3) - x1*sin(x5)*sin(x3)*x6 + x1*cos(x5)*cos(x3)*x4;
y_d = x2*cos(x5)*cos(x3) - x1*sin(x5)*cos(x3)*x6 - x1*cos(x5)*sin(x3)*x4;
z_d = x2*sin(x5) + x1*cos(x5)*x6;

z2 = (q*q_d + y*y_d + z*z_d)/sqrt(q^2 + y^2 + z^2);
z4 = (q_d/y - q*y_d/(y^2))/(1 + (q/y)^2);
z6 = z_d/sqrt(q^2 + y^2) -...
z/((q^2 + y^2)^(3/2))*(q*y^2*q_d + y*q^2*y_d);

h_x = [x1; z2; x3; z4; x5; x6];

H_x = jacobian(h_x, [x1, x2, x3, x4, x5, x6]);
disp(H_x);
