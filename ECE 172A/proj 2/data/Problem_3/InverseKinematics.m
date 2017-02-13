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
    theta0 = 0;
    theta1 = 0;
    theta2 = 0;
    
    
    
    % Obtain end effector position x_e, y_e for current thetas: 
    % HINT: use your ForwardKinematics function
    
    
    
    
    while  1 %(Replace the '1'  with a condition that checks if your estimated [x_e,y_e] is close to [x_e_target,y_e_target])
        
        
        
        % Calculate the Jacobian matrix for current values of theta:
        % HINT: write a function for doing this
       
        
        
        
        % Calculate the pseudo-inverse of the jacobian using 'pinv()': 

        
        
        
        
        % Update the values of the thetas by a small step:
      
        
        
        
        
        % Obtain end effector position x_e, y_e for the updated thetas:
        
        
        
        
        
        % Draw the robot using drawRobot( ) : This will help you visualize how the robot arm moves through the iteration: 
        
        
        
        
        
    
        pause(0.00001)  % This will slow the loop just a little bit to help you visualize the robot arm movement 
    end
    
    
    
    % Set the theta_target values:
    theta0_target = theta0;
    theta1_target = theta1;
    theta2_target = theta2;







end