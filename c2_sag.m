function xs = c2_sag( )

% clc;
% clear all;
% close all;

flag=0;
t=0:0.0001:.2;

for alpha=0.1:0.2:0.9
    for t1=0:0.01:0.15
        for k=0.01:0.02:0.06

            t2=t1+k;
            x=@(t) (1-alpha*((heaviside(t-t1)-heaviside(t-t2)))).*sin(2*pi*50*t); %% Generated Signal
            flag=flag+1;

%                     % Visualization
%                     if flag > 1500 && flag < 1520
%                         figure(flag)
%                         plot(t,x(t));
%                         hold on;
%                     end

            %sampling
            fs=16000-1;
            ts=0:1/fs:0.2;
            xs_temp(flag,:)=x(ts);

        end
    end
end

xs=xs_temp(1:200,:);
csvwrite('dataset2.csv', xs);


