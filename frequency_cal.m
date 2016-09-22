function frequency_cal()
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
global beta1
global lmax
global h1
global E
global p
global f




mode= input(' enter the mode of vibration : \n');

switch mode
    case 1
        beta1=1.8751/lmax;
    case 2
        beta1=4.6941/lmax;
    case 3
        beta1=7.8548/lmax;
    case 4
        beta1=10.9955/lmax;
    otherwise
        beta1=1.8751/lmax;
end

f= 100*((beta1^2)/sqrt(12))*h1*sqrt(E/p)   %frequency of vibration

end

