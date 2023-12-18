% function xs = c17_notch( )

clc;
clear;
close all;

flag=0;
t=0:0.0001:.2;
t1=0:0.0001:.2;

T = 1/50;
c = [1 2 4 6];
N = 10;


for i=1:1:4
    for k=0.1:0.05:0.4
        for td=0.0004:0.0001:0.0012

            c_temp = c(i);
            disp(c_temp);
            s = T/c_temp;
            tc = 0.0002;

            x=@(t) sin(2*pi*50*t) + sign(sin(2*pi*50*t) .* ( k*(heaviside(t-tc) - heaviside(t-td))) + k*(heaviside(t-(tc+s*5)) - heaviside(t-(td+s*5))) + k*(heaviside(t-(tc+s*9)) - heaviside(t-(td+s*9))) ...
                + k*(heaviside(t-(tc+s*0)) - heaviside(t-(td+s*0))) + k*(heaviside(t-(tc+s*5)) - heaviside(t-(td+s*5))) + k*(heaviside(t-(tc+s*10)) - heaviside(t-(td+s*10))) + k*(heaviside(t-(tc+s*15)) - heaviside(t-(td+s*15))) + k*(heaviside(t-(tc+s*19)) - heaviside(t-(td+s*19))) + k*(heaviside(t-(tc+s*0)) - heaviside(t-(td+s*0))) ...
                +k*(heaviside(t-(tc+s*5)) - heaviside(t-(td+s*5)))+ k*(heaviside(t-(tc+s*10)) - heaviside(t-(td+s*10))) + k*(heaviside(t-(tc+s*15)) - heaviside(t-(td+s*15))) + k*(heaviside(t-(tc+s*20)) - heaviside(t-(td+s*20))) + k*(heaviside(t-(tc+s*25)) - heaviside(t-(td+s*25))) + k*(heaviside(t-(tc+s*30)) - heaviside(t-(td+s*30))) + k*(heaviside(t-(tc+s*35)) - heaviside(t-(td+s*35))) + k*(heaviside(t-(tc+s*39)) - heaviside(t-(td+s*39))) ...
                + k*(heaviside(t-(tc+s*0)) - heaviside(t-(td+s*0))) + k*(heaviside(t-(tc+s*5)) - heaviside(t-(td+s*5))) + k*(heaviside(t-(tc+s*15)) - heaviside(t-(td+s*15))) + k*(heaviside(t-(tc+s*20)) - heaviside(t-(td+s*20))) + k*(heaviside(t-(tc+s*25)) - heaviside(t-(td+s*25))) + k*(heaviside(t-(tc+s*30)) - heaviside(t-(td+s*30))) + k*(heaviside(t-(tc+s*35)) - heaviside(t-(td+s*35))) +  k*(heaviside(t-(tc+s*40)) - heaviside(t-(td+s*40))) + k*(heaviside(t-(tc+s*45)) - heaviside(t-(td+s*45))) + k*(heaviside(t-(tc+s*50)) - heaviside(t-(td+s*50))) + k*(heaviside(t-(tc+s*55)) - heaviside(t-(td+s*55))) + k*(heaviside(t-(tc+s*59)) - heaviside(t-(td+s*59))))  ; %% Generated Signal

            flag = flag + 1;

%             % % visualisation
%             if flag >100 && flag < 110
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
csvwrite("dataset17.csv",xs);