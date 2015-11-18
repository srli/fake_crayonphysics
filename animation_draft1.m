

% First make the patch ...

figure
    t1 = 0:2*pi/20:2*pi; 
    X = 5 + sin(t); Y = 2 + cos(t); Z = X*0; 
    h1 = patch(X,Y,Z,'g');
    h2 = patch(X,Y,Z,'b');
    axis([-10 10 -10 10]); 
% Then make it movable 
    moveit2(h1); 
    moveit2(h2);
    thing = h1.XData
  
%It also works for e.g. pcolor and plot:

% Adjust data to fit hypothesis using the mouse ... :-) 
%a = plot(rand(10,10)); 
%moveit2(a);