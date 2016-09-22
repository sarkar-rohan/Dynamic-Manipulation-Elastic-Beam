function update_var()
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
disp('update')
disp('------------------------------------------------------------------');
global x             % current x-coordinate of ball
global y             % current y-coordinate of ball
global x1            % new x-coordinate of ball
global y1          % new y-coordinate of ball          
global ang        %current angle of ball   
global ang1       % new angle of ball
global vx         % vx is current x-velocity of ball, initial value 1
global vy            % vy is current y-velocit of ball, initial value 1
global vx1            % vx is current x-velocity of ball, initial value 1
global vy1           % vy is current y-velocit of ball, initial value 1
global w              %current angular velocity
global w1             %new angular velocity

vx=vx1; % new values being stored as current values to be used in the next iteration

vy=vy1;

w=w1;

x=x1; % new values being stored as current values to be used in the next iteration

y=y1;

ang=ang1;



end

