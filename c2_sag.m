% function [  ] = sag_c2( )

clc;
clear all;
close all;

flag=0;
t=0:0.0001:.2;

for alpha=0.1:0.2:0.9
    for t1=0:0.01:0.15
        for k=0.01:0.02:0.06

            t2=t1+k;
            x=@(t) (1-alpha*((heaviside(t-t1)-heaviside(t-t2)))).*sin(2*pi*50*t); %% Generated Signal
            flag=flag+1;

            %sampling
            fs=16000-1;
            ts=0:1/fs:0.2;
            xs_temp(flag,:)=x(ts);

        end
    end
end

xs=xs_temp(1:200,:);

% visualisation
p=0;
ts=1:1:3200
for i=100:1:120
    stem(ts,xs(i,:));
    p=p+1;
    figure(p);
    hold on;
end

