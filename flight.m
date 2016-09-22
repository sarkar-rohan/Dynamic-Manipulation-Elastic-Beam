function flight()
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


global dt;

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
global motion_type;
 disp('flight');


g=9.81; % gravity

%input parameters
% x->current x-coordinate of ball
% y->current y-coordinate of ball
% vx ->current x-velocity of ball
% vy ->current y-velocity of ball

%output parameters
% x1->updated x-coordinate of ball
% y1->updated y-coordinate of ball
% vx1->updated x-velocity of ball
% vy1->updated y-velocity of ball

ay= -g;  % y-acceleration
ax= 0;   % x-acceleration

dx = vx*dt;   %small change in x
dy = vy*dt;   %small change in y
dtheta = w*dt;

x1 = x+dx;
y1 = y+dy;
ang1 = ang + dtheta;


dvx = ax *dt;   %small change in vx
dvy = ay *dt;   %small change in vy


vy1 = vy + dvy;
vx1 = vx + dvx;
w1=w;

end

