function  beam()
%This function returns the x and y coordinates of the wave generated
%on the beam
%   Detailed explanation goes here
global beta1
global lmax
global f
global ltstep
global c
global t
global wave

 wave = zeros(lmax/ltstep ,2);
 
 i=1;
    
    
    for xw = ltstep:ltstep:lmax                      % xw traverses the length of the wave; same as l
        
        wave(i,1) = xw;
        wave(i,2) = c*(sin(beta1*xw)-sinh(beta1*xw)-((sin(beta1*lmax)+sinh(beta1*lmax))/(cos(beta1*lmax)+cosh(beta1*lmax)))*(cos(beta1*xw)-cosh(beta1*xw)))*sin(2*pi*f*t);
        i=i+1;
        
    end




end

