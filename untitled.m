% First make the patch ...

figure
    t = 0:2*pi/20:2*pi; 
    X = 10 + sin(t); Y = 2 + cos(t); Z = X*0; 
    h = patch(X,Y,Z,'g') 
    axis([-10 10 -10 10]); 
% Then make it movable 
    moveit2(h); 
  
%It also works for e.g. pcolor and plot:

% Adjust data to fit hypothesis using the mouse ... :-) 
%a = plot(rand(10,10)); 
%moveit2(a);