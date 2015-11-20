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

%Cartesian Displacement
figure
hold all
plot(x1, y1)
plot(x2, y2)
legend('Mass 1', 'Mass 2')
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
title('Position')
ylabel('Displacement (rad)')
legend('Mass1', 'Mass2')
%Velocity
subplot(3,1,2)
hold all
plot(T_out, t1d_o)
plot(T_out, t2d_o)
title('Velocity')
ylabel('Velocity (rad/s)')
legend('Mass1', 'Mass2')
%Acceleration
subplot(3,1,3)
hold all
plot(T_out, t1a_o)
plot(T_out, t2a_o)
title('Acceleration')
xlabel('Time (s)')
ylabel('Acceleration (rad/s^2)')
legend('Mass1', 'Mass2')

%Energy
PE1 = M1*g.*y1;
KE1 = M1*L1^2*t1d_o.^2/6;
PE2 = M2*g.*y2;
KE2 = (M2/2)*(L1^2*t1d_o.^2 + (L2^2/3)*t2d_o.^2 + L1*L2*t1d_o.*t2d_o.*cos(t2_o-t1_o));

PE = PE1 + PE2;
KE = KE1 + KE2;
TE = PE + KE;

figure
hold all
plot(T_out, PE)
plot(T_out, KE)
plot(T_out, TE)
legend('PE', 'KE', 'TE')
title('Energy')
xlabel('Time (s)')
ylabel('Energy (J)')

%Reaction forces
figure
subplot(2,1,1)
hold all
plot(T_out, o1_o);
plot(T_out, o2_o);
title('O Reaction')
ylabel('Force (N)')
legend('Mass1', 'Mass2')
subplot(2,1,2)
hold all
plot(T_out, a1_o)
plot(T_out, a2_o)
title('A Reaction')
ylabel('Force (N)')
xlabel('Time (s)')
legend('Mass1', 'Mass2')


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
        