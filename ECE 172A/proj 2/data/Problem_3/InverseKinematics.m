%{
This function is supposed to implement inverse kinematics for a robot arm
with 3 links constrained to move in 2-D. The comments will walk you through
the algorithm for the Jacobian Method for inverse kinematics

INPUTS:
l0, l1, l2: lengths of the robot links
x_e_target, y_e_target: Desired final position of the end effector 

OUTPUTS:
theta0_target, theta1_target, theta2_target: Joint angles of the robot that
take the end effector to [x_e_target,y_e_target]


%}
function [theta0_target, theta1_target, theta2_target] = InverseKinematics(l0,l1,l2,x_e_target,y_e_target)

    % Initialize the thetas to some value
    theta0 = pi/3;
    theta1 = 0;
    theta2 = 0;
    theta = [theta0;theta1;theta2];
    
    
    % Obtain end effector position x_e, y_e for current thetas: 
    % HINT: use your ForwardKinematics function
    [~,~,~,~,x_e,y_e] = ForwardKinematics(l0,l1,l2,theta0,theta1,theta2);
    
 
    while  abs([x_e,y_e]-[x_e_target,y_e_target])>0.1 %(Replace the '1'  with a condition that checks if your estimated [x_e,y_e] is close to [x_e_target,y_e_target])
        % Calculate the Jacobian matrix for current values of theta:
        % HINT: write a function for doing this
       [a,b,c,d,e,f] = jacobian(l0,l1,l2,theta(1),theta(2),theta(3));
       J = [a b c;d e f];
        
        % Calculate the pseudo-inverse of the jacobian using 'pinv()': 

       Jpseudo = pinv(J); 
        
        % Update the values of the thetas by a small step:
        alpha = 0.01;
        
        theta = theta - alpha*Jpseudo*[x_e-x_e_target;y_e-y_e_target];
    
        
        % Obtain end effector position x_e, y_e for the updated thetas:
        [x_1,y_1,x_2,y_2,x_e,y_e] = ForwardKinematics(l0,l1,l2,theta(1),theta(2),theta(3));
               
        
        % Draw the robot using drawRobot( ) : This will help you visualize how the robot arm moves through the iteration: 
        
        drawRobot(x_1,y_1,x_2,y_2,x_e,y_e)
           
        pause(0.00001)  % This will slow the loop just a little bit to help you visualize the robot arm movement 
    end
   
    % Set the theta_target values:
    theta0_target = theta(1);
    theta1_target = theta(2);
    theta2_target = theta(3);

end