function  [x,y]=level_ball(x1)
disp('level')
global threshold_r
global beta1
global lmax
global f
global c
global t
global r
global flag


theta=0;

[dy_dx,theta] =dydx(x1)  ; % derivative of wave

 y=c*(sin(beta1*x1)-sinh(beta1*x1)-((sin(beta1*lmax)+sinh(beta1*lmax))/(cos(beta1*lmax)+cosh(beta1*lmax)))*(cos(beta1*x1)-cosh(beta1*x1)))*sin(2*pi*f*t)+(r+threshold_r/6)*cos(theta);

 if(dy_dx<0)
     x=x1+(r+threshold_r/6)*sin(theta);
 else
     x=x1-(r+threshold_r/6)*sin(theta);
 end

 
end

