% function xs = c19_harmonics_with_swell_with_flicker( )

clc;
clear;
close all;

flag=0;
t=0:0.0001:.2;
alpha = 0.5;
k = 0.05;

for vn=-180:180:180
    for t1=0:0.05:0.15
        for alpha3=0.05:0.05:0.15
            for alpha5=0.05:0.05:0.15
                for lamda=0.05:0.01:0.1
                    for fn=8:4:25

                        t2=t1+k;

                        x=@(t) (1 + lamda* sin(2*pi*fn*t)).*(sin(2*pi*50*t) + (alpha3*sin(3*2*pi*50*t-vn) + alpha5*sin(5*2*pi*50*t-vn))) .* (1 + alpha*(heaviside(t-t1)-heaviside(t-t2))); %% Generated Signal
                        flag = flag + 1;

%                                                 % % visualisation
%                                                 if flag > 1526 && flag < 1550
%                                                     figure(flag)
%                                                     plot(t,x(t));
%                                                     hold on;
%                                                 end

                        %sampling
                        fs=16000-1;
                        ts=0:1/fs:0.2;
                        xs_temp(flag,:)=x(ts);

                    end
                end
            end
        end
    end
end

xs = xs_temp(1001:1025,:);
xs = [xs; xs_temp(1501:1525,:)];
xs = [xs; xs_temp(801:825,:)];
xs = [xs; xs_temp(701:725,:)];
xs = [xs; xs_temp(1026:1050,:)];
xs = [xs; xs_temp(1526:1550,:)];
xs = [xs; xs_temp(826:850,:)];
xs = [xs; xs_temp(726:750,:)];


csvwrite("dataset19.csv",xs);
