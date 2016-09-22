function plot_ball()


global x1            % new x-coordinate of ball
global y1          % new y-coordinate of ball            
global ang1       % new angle of ball
global frame
global r


angle=ang1:0.1:(pi+ang1); 

xp=r*cos(angle);

yp=r*sin(angle);

patch(x1+xp,y1+yp,'r');

angle=(pi+ang1+0.001):0.1:(2*pi+ang1-0.001);

xp=r*cos(angle);

yp=r*sin(angle);

patch(x1+xp,y1+yp,'y');

 axis ([0 400 -200 200])
% frame = getframe;
 drawnow;
%    pause
 cla;
 
 
end
