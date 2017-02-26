%% 
%Run each section separately!
%Script used to test problem 3 functions
close all
%pick some theta values to draw
theta0 = pi/6;
theta1 = pi/4;
theta2 = -1*pi/3;
l0=5;
l1=5;
l2=5;
[x_1,y_1,x_2,y_2,x_e,y_e] = ForwardKinematics(l0,l1,l2,theta0,theta1,theta2);
drawRobot(x_1,y_1,x_2,y_2,x_e,y_e);
%%
%do it again for some other values 
theta0 = pi/6;
theta1 = pi/6;
theta2 = pi/6;
l0=3;
l1=5;
l2=7;
[x_1,y_1,x_2,y_2,x_e,y_e] = ForwardKinematics(l0,l1,l2,theta0,theta1,theta2);
drawRobot(x_1,y_1,x_2,y_2,x_e,y_e);
%% 
%Inverse Kinematics
close all
[theta0_target, theta1_target, theta2_target] = InverseKinematics(5,5,5,8,8)