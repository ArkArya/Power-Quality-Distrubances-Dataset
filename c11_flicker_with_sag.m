% function xs = c11_flicker_with_sag( )

clc;
clear all;
close all;

flag=0;
t=0:0.0001:.2;


for lamda=0.05:0.01:0.1
    for fn=8:3:25
        for alpha=0.3:0.2:0.9
            for t1=0:0.03:0.15
                for k=0.03:0.025:0.08
                    
                    t2=t1+k;
                    x=@(t) (1 + lamda* sin(2*pi*fn*t) - alpha*((heaviside(t-t1)-heaviside(t-t2)))).*sin(2*pi*50*t); %% Generated Signal
                    flag=flag+1;

                    % %% visualisation
                    %         if flag > 1 && flag < 20
                    %             figure(flag)
                    %             plot(t,x(t));
                    %             hold on;
                    %         end

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
csvwrite("dataset11.csv",xs);
