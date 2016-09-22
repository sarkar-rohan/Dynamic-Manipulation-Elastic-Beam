function move_ball()
%move_ball decides whether the ball will be in flight, or will roll with or
%without sliding on the basis of motion_type. It also levels the ball
%incase of intersection

global motion_type;
global x             % current x-coordinate of ball
global y             % current y-coordinate of ball
global x1            % new x-coordinate of ball
global y1          % new y-coordinate of ball  
global flag
global xf
global yf


switch motion_type
    
    case 0
        
        flight();
        
    case 1
        
        contact();
        
%         if(motion_type==0)
%         
%             flight();
%         end
        
    case 2
        
        rolling();
        
%         if(motion_type==0)
%          
%             flight();
%         end
        
    otherwise
        
        disp('motion not defined')
end

% check_intersection(x1,y1)
% 
% if flag==1   
%    [x1,y1]=level_ball(xf);   
% end
if motion_type ~=0
    [x1,y1]=level_ball1(x1);   
end

end

