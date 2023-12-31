function xs = c5_transient( )

% clc;
% clear all;
% close all;

flag=0;
t=0:0.0001:.2;

for chi=0.222:0.08:1.11
    for t1=0:0.01:0.2


        t2=t1+0.001;
        x=@(t) sin(2*50*pi*t)-chi*(exp(-750*(t-t1))-exp(-344*(t-t1))).*(heaviside(t-t1)-heaviside(t-t2)); %% Generated Signal
        flag=flag+1;
       
%             % Visulaization
%             if flag > 100 && flag < 120
%                 figure(flag)
%                 plot(t,x(t));
%                 hold on;
%             end


        %sampling
        fs=16000-1;
        ts=0:1/fs:0.2;
        xs_temp(flag,:)=x(ts);


    end
end

xs=xs_temp(1:200,:);
csvwrite('dataset5.csv', xs);

