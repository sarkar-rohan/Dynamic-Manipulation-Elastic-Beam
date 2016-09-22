function impact()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

disp('impact');

global e;
global r;

global dt;
global mu;
global threshold_r
global threshold_c

global motion_type

g=9.81;
ax=0;
alpha=0;
slope=0;
theta=0;

global x             % current x-coordinate of ball
global y             % current y-coordinate of ball
global x1            % new x-coordinate of ball
global y1          % new y-coordinate of ball          
global ang        %current angle of ball   
global ang1       % new angle of ball
global vx         % vx is current x-velocity of ball, initial value 1
global xf
global yf
global vy            % vy is current y-velocit of ball, initial value 1
global vx1            % vx is current x-velocity of ball, initial value 1
global vy1           % vy is current y-velocit of ball, initial value 1
global w              %current angular velocity
global w1             %new angular velocity
global vw
global flag
global just_impact
% input parameters 
% vx ->current x-velocity of ball
% vy ->current y-velocity of ball
% slope-> dy/dx of wave surface at point of impact of ball

%output parameters
%vx2-> updated x velocity after impact
%vy2-> updated y velocity after impact

if(xf~=-1)
    [x,y]=level_ball(xf);
else
    [x,y]=level_ball1(x);
end
  

if(motion_type~=0)
    just_impact=0;
    return
end


%  [x y]=level_ball(xf);
if(xf~=-1)
[slope,theta] = dydx( xf );
dydt(xf);
else
[slope,theta] = dydx(x);
dydt(x);
end

rot_angle=atan(slope) ;  % angle of surface


R = [cos(rot_angle)  sin(rot_angle) ; -sin(rot_angle)  cos(rot_angle)];   % rotation matrix 

V = [vx;vy]  %% current velocities of ball in old frame

VW= [0;vw]  %% current velocity of wave in old frame% if(w<-0.01)
%     



%     alpha=10*mu*g*cos(theta)/r;
%     
% elseif(w>0.01)
%     
%     alpha=-10*mu*g*cos(theta)/r;
% end


V1 = R*V  ; % current velocities of ball in new frame
VW1 = R*VW; %% current velocity of wave in new frame



if ( V1(1,1)+(r*w)  <-.005)
    
    ax=mu*g*cos(theta)/r;
    alpha=10*mu*g*cos(theta)/r;
    
elseif( V1(1,1)+(r*w)  >.005)
    
    ax=-mu*g*cos(theta)/r;
  alpha=-10*mu*g*cos(theta)/r;
  
end



if( VW1(2,1) > V1(2,1) )
    
V1 = [V1(1,1); e*(VW1(2,1)-V1(2,1))]+VW1   ; % momentum conservation 

else
  
 V1 = [V1(1,1); -e*(VW1(2,1)-V1(2,1))]+VW1;

end    
    
V1(1,1) = V1(1,1)+ ax*dt;

if(abs((V1(2,1)^2/(2*g)))<threshold_c)
    motion_type=1;
    
    if(abs((V1(2,1)^2/(2*g)))<threshold_r)    
        motion_type=2;
    end
    
else
   motion_type=0;
end



Vf = (R') * V1;  % back to old frame 

vx = Vf(1,1)
vy = Vf(2,1)
 



% if(w<-0.01)
%     
%     alpha=10*mu*g*cos(theta)/r;
%     
% elseif(w>0.01)
%     
%     alpha=-10*mu*g*cos(theta)/r;
% end

dw=alpha*dt;

w1= w+dw;

% if(w*w1<0)
%     
%     w1=0;
%     
% end

just_impact=1;
end

