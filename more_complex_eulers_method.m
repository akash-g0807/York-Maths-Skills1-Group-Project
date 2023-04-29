syms t;

y = exp(t);

%input y' = f(y,t)
y_diff = matlabFunction(input("Enter y' as a function of t: "));  
t0 = input("input starting point of interval: ");   %% input starting point of interval "a"
N = input("input number of data points: ");   %% input number of data points to use
tN = input("input end point of interval: ");  %% input endpoint of interval "b"
step = (tN - t0)/N;        %% finding the step through the interval
y0 = subs(y,t,t0);         % initial value

label = '(t0,y0)';             % labelling initial value                        
ezplot(y, [t0 - 1,tN + 1]);  % plotting the analytical solution defined on line 3
title([]);                     % removing title of graph
hold on;
plot(t0,y0,'r*');         % plotting the initial value on graph
text(t0,y0,label,'VerticalAlignment','bottom','HorizontalAlignment','right') % labelling the point (x0,y0)

yk = y0;
tk = t0;
for k = 1:N                              % main algorithm loop
    slope = subs(y_diff, {y, t}, {yk, tk}); % calculating the slope at each point
    tangent = yk + slope*(t-tk);         % calculating tangent function
    yk = subs(tangent, t, (tk + step));   % calclating new value of yk at the next step

    ezplot(tangent, [tk,(tk+step)]);            % plotting tangent
    title([]);
    hold on;
    
    %% Workaround for adding graph labelling
    index_label = int2str(k);
    t_label = strcat('t',index_label);
    y_label = strcat('y',index_label);
    generic_label = strcat('(',t_label,',',y_label,')');
    text(tk + step,yk,generic_label,'VerticalAlignment','bottom','HorizontalAlignment','right');
    plot(tk+step,yk,'r*');

    tk = tk + step;                    % incrementing step
end