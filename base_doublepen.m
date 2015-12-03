%%PSET5 Q1: Sophie Li
%This function calculates the state equations for a double compound
%pendulum. It also took about 20 hours to debug.

%Should look like this: https://www.youtube.com/watch?v=_o_ap98sTwg
function base_doublepen
close all

L1 = 1;
L2 = 1.5;
L3 = 1;
M1 = 10;
M2 = 10;
M3 = 1;
g = 9.81;

theta1_0 = pi/3;
theta1v_0 = 0;
theta2_0 = pi/4;
theta2v_0 = 0;
theta3_0 = pi/4;
theta3v_0 = 0;

t_interval = [0 20];
initial_vals = [theta1_0; theta1v_0; theta2_0; theta2v_0; theta3_0; theta3v_0];

options = odeset('RelTol', 1e-7);
[T_out, Z_out] = ode45(@motion, t_interval, initial_vals, options);


t1_o = Z_out(:,1);
t1d_o = Z_out(:,2);
t2_o = Z_out(:,3);
t2d_o = Z_out(:,4);
t3_o = Z_out(:,5);
t3d_o = Z_out(:,6);

x1 = L1/2.*sin(t1_o);
y1 = -L1/2.*cos(t1_o);
x2 = x1*2 + L2/2.*sin(t2_o);
y2 = y1*2 - L2/2.*cos(t2_o);
x3 = x1*2 + x2*2 + L3/2.*sin(t3_o);
y3 = y1*2 + x2*2 + L3/2.*cos(t3_o);

LHS = zeros(length(T_out), 9);
for i = 1:length(T_out)
    LHS(i, :) = calc_LHS(Z_out(i, :));
end

t1a_o = LHS(:, 1);
t2a_o = LHS(:, 2);
t3a_o = LHS(:, 3);

%Cartesian Displacement
figure
hold all
plot(x1, y1)
plot(x2, y2)
plot(x3, y3)
legend('Mass 1', 'Mass 2', 'Mass 3')
title('Displacement')
xlabel('X (m)')
ylabel('Y (m)')

%Tangential Position/Velocity/Acceleration
figure
%Position
subplot(3,1,1)
hold all
plot(T_out, t1_o)
plot(T_out, t2_o)
plot(T_out, t3_o)
title('Position')
ylabel('Displacement (rad)')
legend('Mass1', 'Mass2', 'Mass3')
%Velocity
subplot(3,1,2)
hold all
plot(T_out, t1d_o)
plot(T_out, t2d_o)
plot(T_out, t3d_o)
title('Velocity')
ylabel('Velocity (rad/s)')
legend('Mass1', 'Mass2', 'Mass3')
%Acceleration
subplot(3,1,3)
hold all
plot(T_out, t1a_o)
plot(T_out, t2a_o)
plot(T_out, t3a_o)
title('Acceleration')
xlabel('Time (s)')
ylabel('Acceleration (rad/s^2)')
legend('Mass1', 'Mass2', 'Mass3')

%Energy
PE1 = M1*g.*y1;
KE1 = M1*L1^2*t1d_o.^2/6;
PE2 = M2*g.*y2;
KE2 = (M2/2)*(L1^2*t1d_o.^2 + (L2^2/3)*t2d_o.^2 + L1*L2*t1d_o.*t2d_o.*cos(t2_o-t1_o));
PE3 = M3*g.*y3;
KE3 = 0;
TE = PE1 + KE1 + PE2 + KE2 + PE3 + KE3;

    function vals = calc_LHS(Z)
        t1 = Z(1);
        t1d = Z(2);
        t2 = Z(3);
        t2d = Z(4);
        t3 = Z(5);
        t3d = Z(6);
        
        t2a = t2 - t1;
        t3a = t3 - t2;
        t3b = t3 - t1;
       
        A = [0, 0, 0, 1, 0, cos(t2a), -sin(t2a), 0, 0;
            -M1*(L1/2), 0, 0, 0, 1, sin(t2a), cos(t2a), 0, 0;
            -M2*L1*sin(t2a), 0, 0, 0, 0, -1, 0, cos(t3a), -sin(t3a);
            M2*L1*cos(t2a), M2*(L2/2), 0, 0, 0, 0, 1, -sin(t3a), -cos(t3a);
            M3*L1*sin(t3b), M3*L2*sin(t3a), 0, 0, 0, 0, 0, 1, 0;
            M3*L1*cos(t3b), -M3*L2*cos(t3a), M3*(L3/2), 0, 0, 0, 0, 0, 1;
            (M1*L1^2)/12, 0, 0, 0, L1/2, (L1/2)*sin(t2a), (L1/2)*cos(t2a), 0, 0;
            0, (M2*L2^2)/12, 0, 0, 0, 0, -L2/2, (-L2/2)*sin(t3a), (-L2/2)*cos(t3a);
            0, 0, (M3*L3^2)/12, 0, 0, 0, 0, 0, -L3/2];
          
       r = [-M1*t1d^2*(L1/2) - M1*g*cos(t1);
           M1*g*sin(t1);
           -M2*t1d^2*L1*cos(t2a) - M2*t2d^2*(L2/2) - M2*g*cos(t2);
           -M2*t1d^2*L1*sin(t2a) - M2*g*sin(t2);
           M3*t1d^2*L1*cos(t3b) + M3*t2d^2*L2*cos(t3a) + M3*t3d^2*(L3/2) + M3*g*cos(t3);
           -M3*t1d^2*L1*sin(t3b) - M3*t2d^2*L2*sin(t3a) - M3*g*sin(t3);
           0;
           0;
           0];
           
        
        vals = A\r; 
    end

    function vals = motion(T, Z)
        t1d = Z(2);
        t2d = Z(4);
        t3d = Z(6);
        
        res = calc_LHS(Z);
        
        t1dd = res(1);
        t2dd = res(2);
        t3dd = res(3);

        vals = [t1d; t1dd; t2d; t2dd; t3d; t3dd];
        
    end

end
        