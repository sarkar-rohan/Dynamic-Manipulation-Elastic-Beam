
 function [P_Loss]=mybackfor(DG)
%function [Linecurrentp,Busvoltagep,Pl,Ql,TOTALPL,TOTALQL]=mybackfor(DG)

%Forward Backward Sweep algorithm for Radial Distribution System
%clc;
%clear all;
c =1;      %let the central bus no is 1.
   Iterations =5; % input('Enter the no. of iterations : ');
ldata = linedata37();
                                        
bdata=busdata37();
 


%  
sizl=size(ldata);        %[sizl=37,5]
   sizb=size(bdata);
   totalbus=sizb(1,1);   % no of total bus %38
   br=totalbus-1;        % no of branches = 37 here
   R=zeros(br,1);
   X=zeros(br,1);
   P=zeros(totalbus,1);
   Q=zeros(totalbus,1);
for i=1:br
    R(i,1)=(ldata(i,3));      %get resistance 
    X(i,1)=(ldata(i,4));      % get reactance
end
for i=1:totalbus
    P(i,1)=(bdata(i,2));      % get real load on bus
    Q(i,1)=(bdata(i,3));      % get reactive load on bus
end

%Find Terminal Buses and intermiditae bus of the network()
    Terminalbuses=zeros(totalbus,1);
    Intermediatebuses=zeros(br,1);
   for i=1:br
       Terminalbuses(i,1)=0; %initialize Terminalbuses and Intermediate buses matrix
                                     %here terminal bus is[0----0
       Intermediatebuses(i,1)=0; 
      
   end
  co=0;in=0;
   for i=1:sizl(1,1)    %sizl(1,1)=37 here (no of buses/node)
     for j=1:sizl(1,1)
         if (i~=j)&&(ldata(i,2)==ldata(j,1)) %check whether the (to bus no)is equal to (from bus no)
             co=co+1;
         end
     end
   if co==0
         in=in+1;
         Terminalbuses(in,1)=ldata(i,2);  %if the above checking is correct then it is the intermiditebus...
   else                              %if not true then the bus is terminal bus
         in=in+1;
         Intermediatebuses(in,1)=ldata(i,2);
  end
   co=0;
   end
   Busvoltage=zeros(totalbus,1);   
    Linecurrent=zeros(br,1);
   %Initializing Voltage and Current matrices
   for i=1:totalbus
       Busvoltage(i,1)=0;   
   end
   for i=1:sizl(1,1) %37
       Linecurrent(i,1)=0;
   end
   for i=1:totalbus-1      %set the bus voltage to 1 if it is the terminal bus other wise set to zero
       if(Terminalbuses(i,1)~=0)
          Busvoltage( Terminalbuses(i,1),1)=1;
       end
   end
   
  for itr=1:Iterations
   for abc=1:20  % here abc is step calculate the network parameters
           %abc(min)=minimum value of step is longest radial networks bus(to calculate the entire network) 
       %backward  sweep  method
     t=0;int=0;
     for i=1:sizl(1,1)   %38
        for j=1:totalbus-1 %37
          if ldata(i,2)== Terminalbuses(j,1) %calculate the line current(load current) of the terminalbuss from its
              t=t+1;  %conjugate(s/v) formula.
          end
        end
     
        if(t~=0)
            Linecurrent(i,1)=conj(complex(bdata(ldata(i,2),2),bdata(ldata(i,2),3))./Busvoltage(ldata(i,2),1));
        end                     %((complex(Pi,Qi)/V)*
        t=0;
     end
     for i=1:sizl(1,1)
        for j=1:totalbus-1
           if ldata(i,2) == Intermediatebuses(j,1)
              int=int+1;
           end
        end       %calculate terminal buses bus voltage (V(k+1) =V(k)- Z(k+1)I(k+1))
        if(int~=0)%calculate line current of the front branch by add terminal load current + 
            Busvoltage(ldata(i,2),1)=Busvoltage(ldata(i+1,2),1)+((Linecurrent(i+1,1))*(complex(ldata(i+1,3),ldata(i+1,4))));
            Linecurrent(i,1)=(conj(complex(bdata(ldata(i,2),2),bdata(ldata(i,2),3))./Busvoltage(ldata(i,2),1)))+ Linecurrent(i+1,1);
        end
        int=0;
     end
  end
   
   %forward %backward sweep
     Busvoltage(c,1)=1; % set center bus voltage to one
     for i=1:sizl(1,1)   %37%  Nodal  voltages  are  computed  in  the  forward sweep as Vi (k +1) = V (k)- Z(k +1)I (k +1)
           if (ldata(i,1)==c)
Busvoltage(ldata(i,2),1)=Busvoltage(c,1)-(Linecurrent(i,1)*(complex(ldata(i,3),ldata(i,4))));
           else
Busvoltage(ldata(i,2),1)=Busvoltage(ldata(i,1),1)-(Linecurrent(i,1)*(complex(ldata(i,3),ldata(i,4))));
           end
     end
 end
     Busvoltagep=abs(Busvoltage);
     Linecurrentp=abs(Linecurrent);
     % losses


dV=Busvoltage(ldata(:,1))-Busvoltage(ldata(:,2));
%pl=zeros(1,32);
pl=(dV.*conj(Linecurrent));   
Power_Loss=sum(pl);  %pu
P_Loss=real(Power_Loss);
%Q_Loss=imag(Power_Loss);

% for f=1:br
%     Pl(f,1)=( Linecurrentp(f,1)^2)*R(f,1);
%     Ql(f,1)=X(f,1)*( Linecurrentp(f,1)^2);
%     TOTALPL(1,1)=TOTALPL(1,1)+Pl(f,1);
%     TOTALQL(1,1)=TOTALQL(1,1)+Ql(f,1);
% end
 %display(Linecurrentp);
 %display(Busvoltagep);
% display(Pl);
% display(Ql);
 %display(P_Loss);
 %display(Q_Loss);
% calling various function
%industrial(Busvoltagep,totalbus)
%commercial(Busvoltagep,totalbus)
%residential(Busvoltagep,totalbus)

%limitvol(Busvoltagep,totalbus);   %calling limitvol function
%limitlinemva()  
