function H_k = calc_measurement_jacobian(x)

    x1 = x(1);
    x2 = x(2);
    x3 = x(3); 
    x4 = x(4);
    x5 = x(5);
    x6 = x(6);

    H_k = [1, 0, 0, 0, 0, 0;...
        (sin(x5)*(x2*sin(x5) + x1*x6*cos(x5)) - cos(x3)*cos(x5)*(x1*x4*cos(x5)*sin(x3) - x2*cos(x3)*cos(x5) + x1*x6*cos(x3)*sin(x5)) + cos(x5)*sin(x3)*(x2*cos(x5)*sin(x3) + x1*x4*cos(x3)*cos(x5) - x1*x6*sin(x3)*sin(x5)) + x1*x6*cos(x5)*sin(x5) - x1*cos(x3)*cos(x5)*(x4*cos(x5)*sin(x3) + x6*cos(x3)*sin(x5)) + x1*cos(x5)*sin(x3)*(x4*cos(x3)*cos(x5) - x6*sin(x3)*sin(x5)))/(x1^2*cos(x3)^2*cos(x5)^2 + x1^2*cos(x5)^2*sin(x3)^2 + x1^2*sin(x5)^2)^(1/2) - ((2*x1*sin(x5)^2 + 2*x1*cos(x3)^2*cos(x5)^2 + 2*x1*cos(x5)^2*sin(x3)^2)*(x1*sin(x5)*(x2*sin(x5) + x1*x6*cos(x5)) - x1*cos(x3)*cos(x5)*(x1*x4*cos(x5)*sin(x3) - x2*cos(x3)*cos(x5) + x1*x6*cos(x3)*sin(x5)) + x1*cos(x5)*sin(x3)*(x2*cos(x5)*sin(x3) + x1*x4*cos(x3)*cos(x5) - x1*x6*sin(x3)*sin(x5))))/(2*(x1^2*cos(x3)^2*cos(x5)^2 + x1^2*cos(x5)^2*sin(x3)^2 + x1^2*sin(x5)^2)^(3/2)), (x1*cos(x3)^2*cos(x5)^2 + x1*cos(x5)^2*sin(x3)^2 + x1*sin(x5)^2)/(x1^2*cos(x3)^2*cos(x5)^2 + x1^2*cos(x5)^2*sin(x3)^2 + x1^2*sin(x5)^2)^(1/2), 0, 0, (x1*cos(x5)*(x2*sin(x5) + x1*x6*cos(x5)) + x1*sin(x5)*(x2*cos(x5) - x1*x6*sin(x5)) - x1*cos(x3)*cos(x5)*(x2*cos(x3)*sin(x5) + x1*x6*cos(x3)*cos(x5) - x1*x4*sin(x3)*sin(x5)) + x1*cos(x3)*sin(x5)*(x1*x4*cos(x5)*sin(x3) - x2*cos(x3)*cos(x5) + x1*x6*cos(x3)*sin(x5)) - x1*cos(x5)*sin(x3)*(x2*sin(x3)*sin(x5) + x1*x4*cos(x3)*sin(x5) + x1*x6*cos(x5)*sin(x3)) - x1*sin(x3)*sin(x5)*(x2*cos(x5)*sin(x3) + x1*x4*cos(x3)*cos(x5) - x1*x6*sin(x3)*sin(x5)))/(x1^2*cos(x3)^2*cos(x5)^2 + x1^2*cos(x5)^2*sin(x3)^2 + x1^2*sin(x5)^2)^(1/2) + ((2*x1^2*cos(x3)^2*cos(x5)*sin(x5) - 2*x1^2*cos(x5)*sin(x5) + 2*x1^2*cos(x5)*sin(x3)^2*sin(x5))*(x1*sin(x5)*(x2*sin(x5) + x1*x6*cos(x5)) - x1*cos(x3)*cos(x5)*(x1*x4*cos(x5)*sin(x3) - x2*cos(x3)*cos(x5) + x1*x6*cos(x3)*sin(x5)) + x1*cos(x5)*sin(x3)*(x2*cos(x5)*sin(x3) + x1*x4*cos(x3)*cos(x5) - x1*x6*sin(x3)*sin(x5))))/(2*(x1^2*cos(x3)^2*cos(x5)^2 + x1^2*cos(x5)^2*sin(x3)^2 + x1^2*sin(x5)^2)^(3/2)), -(x1^2*cos(x3)^2*cos(x5)*sin(x5) - x1^2*cos(x5)*sin(x5) + x1^2*cos(x5)*sin(x3)^2*sin(x5))/(x1^2*cos(x3)^2*cos(x5)^2 + x1^2*cos(x5)^2*sin(x3)^2 + x1^2*sin(x5)^2)^(1/2);...
        0, 0, 1, 0, 0, 0;...
        0, 0, 0, 0, 1, 0];
end