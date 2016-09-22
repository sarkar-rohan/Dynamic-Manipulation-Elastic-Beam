% writerObj = VideoWriter('v4.avi');
% writerObj.FrameRate = 60;
% open(writerObj);
% set(gca,'nextplot','replacechildren');
% set(gcf,'Renderer','zbuffer');

initfnc;

% -------------------------------------------------------------------------
% SIMULATION PARAMETERS
global dt         %% time step for kinematics evaluation  
global t
global x             % current x-coordinate of ball
global y             % current y-coordinate of ball
global x1            % new x-coordinate of ball
global y1          % new y-coordinate of ball   
global ltstep      % length traversal step
             
global vw
global flag;
global lmax
dt = .04;         %time step for ball motion
global frame
ststep=dt ;      %simulation time step
time= 1000;       % simulation time parameter
ltstep=lmax/100;
%--------------------------------------------------------------------------

frequency_cal();

for t = 0:ststep:time
    
   beam();
    
   if x>lmax || x<0
       break;
   end
   
   check_intersection(x,y);
   
   if flag==1
    
       impact();
       
       move_ball();
       
   else
       
       move_ball();
       
   end
   
%    [dy_dx,theta] = dydx( x1 )
%    vx1
%    vy1
%    dydt(x1);
%    vw
hold on
   plot_wave();
   plot_ball();

   update_var();
   
  
%   writeVideo(writerObj,frame);
    
hold off
   
end
% close(writerObj);

