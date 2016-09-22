function [ dy_dx,theta] = dydx( xf )

global f          %frequency of vibration
global c          %amplitude of vib
global beta1
global lmax
global t



dy_dx = c*(beta1*cos(beta1*xf) - beta1*cosh(beta1*xf) + ((beta1*sin(beta1*xf) + beta1*sinh(beta1*xf))*(sin(lmax*beta1) + sinh(lmax*beta1)))/(cos(lmax*beta1) + cosh(lmax*beta1)))*sin(2*pi*f*t) ;
theta=0;

if(dy_dx<0)
    
    theta=-atan(dy_dx);
    
elseif(dy_dx>0)
    
    theta=atan(dy_dx);
    
end

end

