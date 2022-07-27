clear all ,close all,clc
%%we need to integrate the equation

%% which we created for blasius
dt=0.2;
timespan=0:dt:10; %this is timespan , which nothing but η is equation and we have taken interval of η with steps of dt
p1=0.1; % is the first guessing value 
p2=1.0; % is the second guessing value
errth=1e-05; % is the desired accuracy we want to achieve
err=1.0; %this is for entering in the loop
i=1;
while (err>errth)
if i==1
 x1=[0,0,p1];
[t,x1]=ode45(@(t,x1)blasius(t,x1),timespan,x1);
%plot(t,x1(:,1),'r')
%hold on
%plot(t,x1(:,2),'k')
%hold on
%plot(t,x1(:,3),'b')
%hold on

m1=x1(end,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
x2=[0,0,p2];
[t,x2]=ode45(@(t,x2)blasius(t,x2),timespan,x2);
%plot(t,x2(:,1),'r')
%hold on
%plot(t,x2(:,2),'k')
%hold on
%plot(t,x2(:,3),'b')
%hold on
%xlabel('η')
%ylabel('F1,F1P,F1PP')
%axis([0 10 0 10])
%legend('F1','F1P','F1PP')

m2=x2(end,2);
%plot(([p1 p2]),([m1 m2]),'bo')
%axis([-0.5 2.5 -0.5 2.5])
%hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

else
p2=((p2-p1)/(m2-m1))*(1-m1)+p1; % this is linear interpolation
x3=[0,0,p2];
[t,x3]=ode45(@(t,x3)blasius(t,x3),timespan,x3);
m2=x3(end,2);
err=abs(1-m2);
%plot(([p2]),([m2]),'k*')
%axis([-0.5 2.5 -0.5 2.5])
%xlabel('p')
%ylabel('m')
%drawnow
%plot(t,x3(:,1),'r')
%hold on
plot(t,x3(:,2),'bo')
%hold on
%plot(t,x3(:,3),'b')
%hold on
xlabel('η')
ylabel('F1P=u/U')
end
i=i+1;

end




