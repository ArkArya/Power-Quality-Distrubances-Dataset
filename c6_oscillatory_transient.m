function xs = c6_oscillatory_transient( )

% clc;
% clear all;
% close all;

flag=0;
t=0:0.0001:.2;

for v=-180:60:180
    for tao=0.008:0.01:0.04
        for beta=0.222:0.3:1.11
            for fn=300:300:900
                for t1=0:0.03:0.2

                    t2=t1+0.02;
                    x=@(t) sin(2*50*pi*t)+beta*(exp(-(t-t1)/tao)).*sin(2*fn*pi*(t-t1)-v).*(heaviside(t-t2)-heaviside(t-t1)); %% Generated Signal
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
    end
end

xs=xs_temp(1:200,:);
csvwrite('dataset6.csv', xs);

