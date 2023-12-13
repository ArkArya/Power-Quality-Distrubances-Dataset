function xs = c7_harmonics( )

% clc;
% clear all;
% close all;

flag=0;
t=0:0.0001:.2;

for alpha3=0.05:0.03:0.15
    for alpha5=0.05:0.04:0.15
        for alpha7=0.05:0.05:0.15
            for vn=-180:60:180

                x=@(t) (sin(2*pi*50*t) + alpha3*sin(3*2*pi*50*t-vn) + alpha5*sin(5*2*pi*50*t-vn) + alpha7*sin(7*2*pi*50*t-vn)); %% Generated Signal
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

xs=xs_temp(1:200,:);
csvwrite('dataset7.csv', xs);

