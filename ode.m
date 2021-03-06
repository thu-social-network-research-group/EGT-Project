%function show_sir(series,parameter)
clc;clear all;
%k=20;

%x=[0.1,0.2,0.2,0.5];

[t,x]=ode45(@im,[0:400],[0.1,0.2,0.3,0.4]);
plot(t,x);


function y=im(t,x)
Ua=[0.6,0.8;0.8,0.4];
Ub=[0.6,0.8;0.8,0.4];
U=[Ua(1,1)*Ub,Ua(1,2)*Ub;Ua(2,1)*Ub,Ua(2,2)*Ub];
k=20;
f=U*x;
fi=x'*f;
b=zeros(4,4);
for i=1:4
    for j= 1:4
        b(i,j)=((k+3)*U(i,i)+3*U(i,j)-3*U(j,i)-(k+3)*U(j,j))/((k+3)*(k-2));
    end
end
g=b*x;
    y=[x(1)*(f(1)+g(1)-fi),x(2)*(f(2)+g(2)-fi),x(3)*(f(3)+g(3)-fi),x(4)*(f(4)+g(4)-fi)]';
end








%     function y = sir(t,x)
%         y = [-beta*x(1)*x(2), beta*x(1)*x(2)-gamma*x(2),  gamma*x(2)]';        
%     end
% 
%     beta = parameter(1);
%     gamma = parameter(2);
%     N = parameter(3);
%     series_one = series/N;
% %     m = max(series_one);
%     [t,x] = ode45(@sir, [0:127], [0.99999, 0.00001, 0]);
%     %I = x(:,2).';
%     plot(t, series_one,'LineWidth',1.5);
%     hold on
%     %plot(t,I,'LineWidth',1.5);
%     %legend('ʵ������','��Ͻ��')
%     %set(gcf,'unit','centimeters','position',[10 5 9 6.67]);
% end