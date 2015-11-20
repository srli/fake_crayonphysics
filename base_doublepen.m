%%PSET5 Q1: Sophie Li
%This function calculates the state equations for a double compound
%pendulum. It also took about 20 hours to debug.

function q1_pendulum
close all

L1 = 1;
L2 = 1.5;
M1 = 10;
M2 = 50;
g = 9.81;

theta1_0 = pi/3;
theta1v_0 = 0;
theta2_0 = -pi/4;
theta2v_0 = 0;

t_interval = [0 20];
initial_vals = [theta1_0; theta1v_0; theta2_0; theta2v_0];

options = odeset('RelTol', 1e-7);
[T_out, Z_out] = ode45(@motion, t_interval, initial_vals, options);

t1_o = Z_out(:,1);
t1d_o = Z_out(:,2);
t2_o = Z_out(:,3);
t2d_o = Z_out(:,4);
t3_o = t2_o - t1_o;

x1 = L1/2.*sin(t1_o);
y1 = -L1/2.*cos(t1_o);
x2 = x1*2 + L2/2.*sin(t2_o);
y2 = y1*2 - L2/2.*cos(t2_o);

LHS = zeros(length(T_out), 6);
for i = 1:length(T_out)
    LHS(i, :) = calc_LHS(Z_out(i, :));
end

t1a_o = LHS(:, 1);
t2a_o = LHS(:, 2);
a1_o = LHS(:, 3);
a2_o = LHS(:, 4);
o1_o = LHS(:, 5);
o2_o = LHS(:, 6);

%Energy
PE1 = M1*g.*y1;
KE1 = M1*L1^2*t1d_o.^2/6;
PE2 = M2*g.*y2;
KE2 = (M2/2)*(L1^2*t1d_o.^2 + (L2^2/3)*t2d_o.^2 + L1*L2*t1d_o.*t2d_o.*cos(t2_o-t1_o));

PE = PE1 + PE2;
KE = KE1 + KE2;
TE = PE + KE;

% now animate
figure
axis([-5 5 -3 2])

    for i=1:length(T_out)
        plot(x1(i),y1(i),'b.', 'MarkerSize', 30)
        hold on;
        plot(x2(i),y2(i),'b.', 'MarkerSize', 30)
        X1_line=  linspace(0, x1(i), 10);
        Y1_line = linspace(0, y1(i), 10);
        
        X2_line = linspace(x1(i), x2(i), 10);
        Y2_line = linspace(y1(i), y2(i), 10);
        hold on
        plot(X1_line, Y1_line,'k','Linewidth',2)
        plot(X2_line, Y2_line,'k','Linewidth',2)

%         % Plot the current location of the projectile
%         % Add a green arrow for the velocity
%         quiver(x1(i),y1(i),0.2*vx1(i),0.2*vy1(i),'g','Linewidth',2)
%         quiver(x2(i),y2(i),0.2*vx2(i),0.2*vy2(i),'g','Linewidth',2)
% 
%         % And a red one for the acceleration
%         quiver(x1(i),y1(i),0.01*ax1(i),0.01*ay1(i),'r','Linewidth',2)
%         quiver(x2(i),y2(i),0.01*ax2(i),0.01*ay2(i),'r','Linewidth',2)

        % Make sure the axis stays fixed size
        axis([-5 5 -3 2])
        drawnow

        pause(0.001)
        hold off
    end

    function vals = calc_LHS(Z)
        t1 = Z(1);
        t1d = Z(2);
        t2 = Z(3);
        t2d = Z(4);
        
        t3 = t2 - t1;
       
        A = [0, 0, -cos(t3), sin(t3), -1, 0;
            M1*L1/2, 0, -sin(t3), -cos(t3), 0, -1;
            M2*L1*sin(t3), 0, 1, 0, 0, 0;
            M2*L1*cos(t3), M2*L2/2, 0, 1, 0, 0;
            M1*L1/3, 0, -sin(t3), -cos(t3), 0, 0;
            0, M2*L2/6, 0, -1, 0, 0];
          
       r = [(M1*t1d^2*L1)/2 + M1*g*cos(t1);
           -M1*g*sin(t1);
           M2*t1d^2*L1*cos(t3) + (M2*t2d^2*L2)/2 + M2*g*cos(t2);
           -M2*t1d^2*L1*sin(t3) - M2*g*sin(t2);
           -(M1*g*sin(t1))/2;
           0];
        
        vals = A\r; 
    end

    function vals = motion(T, Z)
        t1d = Z(2);
        t2d = Z(4);
        
        res = calc_LHS(Z);
        
        t1dd = res(1);
        t2dd = res(2);

        vals = [t1d; t1dd; t2d; t2dd];
        
    end

end
        