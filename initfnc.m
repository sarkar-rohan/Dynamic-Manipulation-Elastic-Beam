
%initfnc  initializes the variables 


clc
clear all



% BEAM
% PARAMETERS---------------------------------------------------------------
global E          %young´s modulus
global p          %mass density
global lmax       % max length of wave to be visualised
global f          %frequency of vibration
global c          %amplitude of vib
global beta1      %paramter for frequency calculation,check function frequency_cal
global ltstep     %discretizing x-step for wave
global wave       %wave x and y coordinates
global h1         %height of cross section of beam
global vw         %velocity of wave,dy/dt
h1=.0006;
E=200e9;
p=7800;
lmax=400;   

c = 40;          % amplitude
dy_dt=0;
theta=0;        %angle of rotation,definition in function dydx
dy_dx=0;
% -------------------------------------------------------------------------
% CONTACT PARAMETERS
global e          %coefficient of restitution
global mu         %coefficient of friction
global xf     % xf and yf are the points of intersection of ball and wave,if any. default value when no intersection is detected is (-1,-1);
global yf
global flag   %flag==1 if intersection is detected,else 0
global just_impact

just_impact=0;
mu=.5;         
e=.6;
xf=[];
yf=[];
flag=0;

% -------------------------------------------------------------------------
% BALL PARAMETERS
global r           %radius of ball
global mass
global energy
global motion_type  % for flight,motion_type=0; for rolling with sliding,motion_type=1; for rolling without sliding,motion_type=2
motion_type=0;
mass=2;
r=12;
motion_type=0;
global x
x=200;             % current x-coordinate of ball
global y
y=160;             % current y-coordinate of ball
global x1
x1=x;             % new x-coordinate of ball
global y1          % new y-coordinate of ball
y1=y;          
global ang        %current angle of ball
ang = 0;   
global ang1
ang1 = 0;        % new angle of ball
global vx
vx=0;            % vx is current x-velocity of ball, initial value 1
global vy
vy=-30;            % vy is current y-velocit of ball, initial value 1
global vx1
vx1=vx;            % vx is current x-velocity of ball, initial value 1
global vy1
vy1=vy;            % vy is current y-velocit of ball, initial value 1
global w
w=0;               %current angular velocity
global w1
w1=w;              %new angular velocity

energy= .5*mass*(vx^2+vy^2) + .5*mass*r^2*w^2;


% -------------------------------------------------------------------------
% PHYSICS AND KINEMATICS PARAMETERS

g=9.81;

global threshold_r             % 
global threshold_c
global threshold_e


threshold_r =r/40;
threshold_c=r/20;
threshold_e=60;


%--------------------------------------------------------------------------
