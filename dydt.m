function dydt(x)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here

global vw

global beta1

global lmax

global f

global c

global t





vw=2*pi*c*f*(sin(beta1*x)-sinh(beta1*x)-((sin(beta1*lmax)+sinh(beta1*lmax))/(cos(beta1*lmax)+cosh(beta1*lmax)))*(cos(beta1*x)-cosh(beta1*x)))*cos(2*pi*f*t);
end

