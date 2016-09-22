function  check_intersection(x,y)
%check_intersection  This function checks for the intersection of the ball and wave
%and updates the intersection points incase of intersection

disp('check')
global lmax;
global wave;
global r;
global flag;
global motion_type;
wave=[-1 -100;wave;lmax+1 -100];



global x1;            % new x-coordinate of ball
global y1;      % new y-coordinate of ball          
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
global just_impact


if(motion_type~=0)
    flag=0;
    just_impact=0;
    return
end


Xb=zeros(101,1);
Yb=zeros(101,1);
i=1;
 
    %create the matrix with the parametric co-ordinates of the ball with
    %centre at x,y
    for angle= 0 : (2*pi)/100 : (2*pi)     
        xp=r*cos(angle);
        yp=r*sin(angle);
        Xb(i)=x+xp;
        Yb(i)=y+yp;
        i=i+1;
    end
    %calling function polyxpoly() to return the 2 points of contact of the
    %ball with the surface/polygon 
    [xi, yi] = polyxpoly(wave(:,1),wave(:,2),Xb,Yb);
    
    s=size(xi);
    
    if(s(1)==2)%checking if the matix is not empty
        %calculating the mean of the 2 points of contact which gives the
        %actual point of contact
        if just_impact==1
            flag=0;
            xf=-1;
            yf=-1;
            return;
        end
        xf=(xi(1)+xi(2))/2;
        yf=(yi(1)+yi(2))/2;
        
%         if(flag==1 && motion_type==0)
%             flag=1;
%             return
%         end
        
        flag=1;
    else
        xf=-1;
        yf=-1;
%         if(flag==1 && motion_type==0)
%             flag=1;
%             return
%         end
        flag=0;
        just_impact=0;
    end
end

