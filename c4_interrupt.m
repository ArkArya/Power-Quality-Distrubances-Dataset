function xs = c4_interrupt( )

% clc;
% clear all;
% close all;

flag=0;
t=0:0.0001:.2;

for alpha=0.9:0.025:1
    for t1=0:0.01:0.15
        for k=0.01:0.02:0.05

            t2=t1+k;
            x=@(t) (1-alpha*((heaviside(t-t1)-heaviside(t-t2)))).*sin(2*pi*50*t); %% Generated Signal
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
end

xs=xs_temp(1:200,:);
csvwrite('dataset4.csv', xs);
