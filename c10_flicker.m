function [  ] = c10_flicker( )

% clc;
% clear all;
% close all;

flag=0;
t=0:0.0001:.2;


for lamda=0.05:0.004:0.1
    for fn=8:1:25

        x=@(t) (1 + lamda* sin(2*pi*fn*t)).*sin(2*pi*50*t); %% Generated Signal
        flag=flag+1;

%         if flag > 100 && flag < 120
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

xs=xs_temp(1:200,:);

% %% visualisation
% p=0;
% ts=1:1:3200
% for i=100:1:120
%     stem(ts,xs(i,:));
%     p=p+1;
%     figure(p);
%     hold on;
% end