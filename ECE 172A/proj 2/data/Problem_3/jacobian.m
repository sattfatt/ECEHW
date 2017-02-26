% calculates the jacobian matrix

function [dxdt0,dxdt1,dxdt2,dydt0,dydt1,dydt2]=jacobian(l0,l1,l2,theta0,theta1,theta2)
    dxdt0 = -l0*sin(theta0)-l1*sin(theta0+theta1)-l2*sin(theta0+theta1+theta2);
    dxdt1 = -l1*sin(theta0+theta1)-l2*sin(theta0+theta1+theta2);
    dxdt2 = -l2*sin(theta0+theta1+theta2);
    dydt0 = l0*cos(theta0)+l1*cos(theta0+theta1)+l2*cos(theta0+theta1+theta2);
    dydt1 = l1*cos(theta0+theta1)+l2*cos(theta0+theta1+theta2);
    dydt2 = l2*cos(theta0+theta1+theta2);
end