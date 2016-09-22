function contact()
%contact Provides the rolling with sliding motion to the ball; first
%transforms the velocity into new frame of reference aligned with the wave
%at the point of intersection
%   Detailed explanation goes here

disp('contact')
global dt
global mu
global r
global threshold_c
global threshold_r
global motion_type;

alpha=0;


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
global vw
global just_impact

just_impact=0;
% [x y] =level_ball(x);
g=9.81; % gravity


[dy_dx,theta]=dydx(x);
dydt(x);


rot_angle=atan(dy_dx) ;   % rotation angle

R = [cos(rot_angle)  sin(rot_angle) ; -sin(rot_angle)  cos(rot_angle)];   % rotation matrix

V = [vx;vy];
VW=[0;vw];
V = R*V;   % current velocities of ball in new frame
VW=R*VW;
vx=V(1,1);
vy=V(2,1);
vw=VW(2,1);

ax=0;
dvx=0;
dw=0;

if(dy_dx >0.005 )
    
    if(vx+r*w >0 )
        ax=-g*sin(theta)-mu*g*cos(theta);
        
        alpha=-mu*g*cos(theta)/r;
        
    elseif(vx+r*w<0 )
        ax=-g*sin(theta)+mu*g*cos(theta);
        
        alpha=mu*g*cos(theta)/r;
        
    end
    
elseif(dy_dx <-.005 )
    
    if(vx+r*w >0 )
        ax=g*sin(theta)-mu*g*cos(theta);
        
        alpha=-mu*g*cos(theta)/r;
        
    elseif(vx+r*w<0 )
        ax=g*sin(theta)+mu*g*cos(theta);
        
        alpha=mu*g*cos(theta)/r;
        
    end
    
elseif(-.005<dy_dx <.005 )
    
    ax=0;
    alpha=0;
    
    
end



dvx=ax*dt;   %small change in vx
dw=alpha*dt;
vy1=vy;
vx1=vx+dvx;
w1=w+dw;


if(abs((vy1^2/(2*g)))<threshold_c)
    
    motion_type=1;
    
    if(abs((vy1^2/(2*g)))<threshold_r)
        
        motion_type=2;
        
    end
   
else
    
   motion_type=0;
   return
   
end



V = [vx1;vy1];
V = (R') * V;  % back to old frame
vx1=V(1,1);
vy1=V(2,1);


% if(vy1>vw)
%     
%     motion_type=0;
%     
%     return
% end


dtheta=w1*dt;
dx=vx1*dt - r*dtheta;   %small change in x
dy=vy1*dt ;   %small change in y


X=[dx;dy];
X= (R') * X;  % back to old frame

x1=x+X(1,1);
y1=y+X(2,1);
ang1=ang+dtheta;




end

