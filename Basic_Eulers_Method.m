syms x;

f = input("Input function y': ");       %% Function we are solving
x0 = input("input point at which you need tangent: ");  %% input starting point of interval "a"
N = input("input number of data points: ");             %% input number of data points to use
xN = input("input end point of interval: ");            %% in
step = (xN - x0)/N;
y0 = exp(x0);
label = '(x0,y0)';
f_diff = diff(f,x);

f_int = int(f_diff,x);

xk1 = x0;
yk1 = y0;

%x1 = x0 + step;
%y1 = exp(x1);
%slope = subs(f_diff,x,x1);
%tangent = y1 + slope*(x-x1);
%ezplot(tangent, [x1,(x1+step)]);
%hold on;
%plot(x1,y1,'r*');
%y1 = subs(tangent, x, (x0+step));
%y1;
%label2 = '(x1,y1)';

ezplot(f_int, [x0 - 1,xN + 1]);
title([]);
hold on;
plot(x0,y0,'r*');
text(x0,y0,label,'VerticalAlignment','bottom','HorizontalAlignment','right')
%ezplot(tangent, [x0,(x0+step)]);
%title([]);
%plot(x0+step,y1,'r*');
%text(x0 + step,y1,label2,'VerticalAlignment','bottom','HorizontalAlignment','right');

%x1 = x0 + step;
%slope = subs(f_diff,x,x1);
%tangent = y1 + slope*(x-x1);
%y2 = subs(tangent, x, (x1+step));
%y2;
%label2 = '(x2,y2)';

%ezplot(tangent, [x1,(x1+step)]);
%title([]);
%plot(x1+step,y2,'r*');

for K = 1:N
    slope = subs(f_diff,x,xk1); 
    tangent = yk1 + slope*(x-xk1);
    yk1 = subs(tangent, x, (xk1+step));
    ezplot(tangent, [xk1,(xk1+step)]);
    title([]);
    hold on;
    index_label = int2str(K);
    x_label = strcat('x',index_label);
    y_label = strcat('y',index_label);
    generic_label = strcat('(',x_label,',',y_label,')');
    text(xk1 + step,yk1,generic_label,'VerticalAlignment','bottom','HorizontalAlignment','right')
    plot(xk1+step,yk1,'r*')
    xk1 = xk1+step;
end