%%PSET5 Q1: Sophie Li
%This function calculates the state equations for a double compound
%pendulum. It also took about 20 hours to debug.

%Should look like this: https://www.youtube.com/watch?v=_o_ap98sTwg
function base_doublepen
close all

L1 = 1;
L2 = 1;
L3 = 1;
L4 = 1;
L5 = 1;

M1 = 1;
M2 = 1;
M3 = 1;
M4 = 1;
M5 = 1;

g = 9.81;

theta1_0 = pi/2;
theta1v_0 = 0.5;
theta2_0 = pi/2;
theta2v_0 = 0.2;
theta3_0 = pi/2;
theta3v_0 = 0.2;
theta4_0 = pi/2;
theta4v_0 = 0.2;
theta5_0 = pi/2;
theta5v_0 = 0.2;

t_interval = 0:.025: 20;
initial_vals = [theta1_0; theta1v_0; theta2_0; theta2v_0; theta3_0; theta3v_0; theta4_0; theta4v_0; theta5_0; theta5v_0];

options = odeset('RelTol', 1e-7);
[T_out, Z_out] = ode45(@motion, t_interval, initial_vals, options);

t1_o = Z_out(:,1);
t1d_o = Z_out(:,2);
t2_o = Z_out(:,3);
t2d_o = Z_out(:,4);
t3_o = Z_out(:,5);
t3d_o = Z_out(:,6);
t4_o = Z_out(:,7);
t4d_o = Z_out(:,8);
t5_o = Z_out(:,9);
t5d_o = Z_out(:,10);

LHS = zeros(length(T_out), 15);
for i = 1:length(T_out)
    LHS(i, :) = calc_LHS(Z_out(i, :));
end

t1dd_o = LHS(:, 1);
t2dd_o = LHS(:, 2);
t3dd_o = LHS(:, 3);
t4dd_o = LHS(:, 4);
t4dd_o = LHS(:, 5);

x1 = L1/2.*sin(t1_o);
y1 = -L1/2.*cos(t1_o);
x2 = L1.*sin(t1_o) + L2/2.*sin(t2_o);
y2 = -L1.*cos(t1_o) - L2/2.*cos(t2_o);
x3 = L1.*sin(t1_o) + L2.*sin(t2_o) + L3/2.*sin(t3_o);
y3 = -L1.*cos(t1_o) - L2.*cos(t2_o) - L3/2.*cos(t3_o);
x4 = L1.*sin(t1_o) + L2.*sin(t2_o) + L3.*sin(t3_o) + L4/2.*sin(t4_o);
y4 = -L1.*cos(t1_o) - L2.*cos(t2_o) - L3.*cos(t3_o) - L4/2.*cos(t4_o);
x5 = L1.*sin(t1_o) + L2.*sin(t2_o) + L3.*sin(t3_o) + L4.*sin(t4_o) + L5/2.*sin(t5_o);
y5 = -L1.*cos(t1_o) - L2.*cos(t2_o) - L3.*cos(t3_o) - L4.*cos(t4_o) - L5/2.*cos(t5_o);

xv1 = L1/2.*cos(t1_o).*t1d_o;
yv1 = L1/2.*sin(t1_o).*t1d_o;
xv2 = xv1*2 + L2/2.*cos(t2_o).*t2d_o;
yv2 = yv1*2 + L2/2.*sin(t2_o).*t2d_o;
xv3 = xv1*2 + L2.*cos(t2_o).*t2d_o + L3/2.*cos(t3_o).*t3d_o;
yv3 = yv1*2 + L2.*sin(t2_o).*t2d_o + L3/2.*sin(t3_o).*t3d_o;
xv4 = xv1*2 + L2.*cos(t2_o).*t2d_o + L3.*cos(t3_o).*t3d_o + L4/2.*cos(t4_o).*t4d_o;
yv4 = yv1*2 + L2.*sin(t2_o).*t2d_o + L3.*sin(t3_o).*t3d_o + L4/2.*sin(t4_o).*t4d_o;
xv5 = xv1*2 + L2.*cos(t2_o).*t2d_o + L3.*cos(t3_o).*t3d_o + L4.*cos(t4_o).*t4d_o + L5/2.*cos(t5_o).*t5d_o;
yv5 = yv1*2 + L2.*sin(t2_o).*t2d_o + L3.*sin(t3_o).*t3d_o + L4.*sin(t4_o).*t4d_o + L5/2.*sin(t5_o).*t5d_o;

xa1 = L1/2.*cos(t1_o).*t1dd_o - L1/2.*sin(t1_o).*t1d_o.^2;
ya1 = L1/2.*sin(t1_o).*t1dd_o + L1/2.*cos(t1_o).*t1d_o.^2;
xa2 = L1.*cos(t1_o).*t1dd_o - L1.*sin(t1_o).*t1d_o.^2 + L2/2.*cos(t2_o).*t2dd_o - L2/2.*sin(t2_o).*t2d_o.^2;
ya2 = L1.*sin(t1_o).*t1dd_o + L1.*cos(t1_o).*t1d_o.^2 + L2/2.*sin(t2_o).*t2dd_o + L2/2.*cos(t2_o).*t2d_o.^2;
xa3 = L1.*cos(t1_o).*t1dd_o - L1.*sin(t1_o).*t1d_o.^2 + L2.*cos(t2_o).*t2dd_o - L2.*sin(t2_o).*t2d_o.^2 ...
      + L3/2.*cos(t3_o).*t3dd_o - L3/2.*sin(t3_o).*t3d_o.^2;
ya3 = L1.*sin(t1_o).*t1dd_o + L1.*cos(t1_o).*t1d_o.^2 + L2.*sin(t2_o).*t2dd_o + L2.*cos(t2_o).*t2d_o.^2 ...
      + L3/2.*sin(t3_o).*t3dd_o + L3/2.*cos(t3_o).*t3d_o.^2;

% %Cartesian Displacement
% figure
% hold all
% plot(x1, y1)
% plot(x2, y2)
% plot(x3, y3)
% legend('Mass 1', 'Mass 2', 'Mass 3')
% title('Displacement')
% xlabel('X (m)')
% ylabel('Y (m)')

%Tangential Position/Velocity/Acceleration
figure
%Position
subplot(3,1,1)
hold all
plot(T_out, t1_o)
plot(T_out, t2_o)
plot(T_out, t3_o)
plot(T_out, t4_o)
title('Position')
ylabel('Displacement (rad)')
legend('Mass1', 'Mass2', 'Mass3', 'Mass4')
%Velocity
subplot(3,1,2)
hold all
plot(T_out, t1d_o)
plot(T_out, t2d_o)
plot(T_out, t3d_o)
plot(T_out, t4d_o)
title('Velocity')
ylabel('Velocity (rad/s)')
legend('Mass1', 'Mass2', 'Mass3', 'Mass4')
%Acceleration
subplot(3,1,3)
hold all
plot(T_out, t1dd_o)
plot(T_out, t2dd_o)
plot(T_out, t3dd_o)
plot(T_out, t4dd_o)
title('Acceleration')
xlabel('Time (s)')
ylabel('Acceleration (rad/s^2)')
legend('Mass1', 'Mass2', 'Mass3', 'Mass4')

%Energy
PE1 = M1*g.*y1;
PE2 = M2*g.*y2;
PE3 = M3*g.*y3;
PE4 = M4*g.*y4;
PE5 = M4*g.*y5;

KE1 = (M1/2)*((xv1.^2 + yv1.^2) + t1d_o.^2*((L1^2)/12));
KE2 = (M2/2)*((xv2.^2 + yv2.^2) + t2d_o.^2*((L2^2)/12));
KE3 = (M3/2)*((xv3.^2 + yv3.^2) + t3d_o.^2*((L3^2)/12));
KE4 = (M4/2)*((xv4.^2 + yv4.^2) + t4d_o.^2*((L4^2)/12));
KE5 = (M5/2)*((xv5.^2 + yv5.^2) + t5d_o.^2*((L5^2)/12));

PE = PE1 + PE2 + PE3 + PE4 + PE5;
KE = KE1 + KE2 + KE3 + KE4 + KE5;
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
 
%%ANIMATION   

x1 = L1.*sin(t1_o);
y1 = -L1.*cos(t1_o);
x2 = L1.*sin(t1_o) + L2.*sin(t2_o);
y2 = -L1.*cos(t1_o) - L2.*cos(t2_o);
x3 = L1.*sin(t1_o) + L2.*sin(t2_o) + L3.*sin(t3_o);
y3 = -L1.*cos(t1_o) - L2.*cos(t2_o) - L3.*cos(t3_o);
x4 = L1.*sin(t1_o) + L2.*sin(t2_o) + L3.*sin(t3_o) + L4.*sin(t4_o);
y4 = -L1.*cos(t1_o) - L2.*cos(t2_o) - L3.*cos(t3_o) - L4.*cos(t4_o);
x5 = L1.*sin(t1_o) + L2.*sin(t2_o) + L3.*sin(t3_o) + L4.*sin(t4_o) + L5.*sin(t5_o);
y5 = -L1.*cos(t1_o) - L2.*cos(t2_o) - L3.*cos(t3_o) - L4.*cos(t4_o) - L5.*cos(t5_o);

figure
    for i = 1:length(T_out)
        clf; % clear the old figure
        axis([-5 5 -5 5]);
        hold all
        PX = [0; x1(i)];
        PY = [0; y1(i)];
        PX2 = [x1(i); x2(i)];
        PY2 = [y1(i); y2(i)];
        PX3 = [x2(i); x3(i)];
        PY3 = [y2(i); y3(i)];
        PX4 = [x3(i); x4(i)];
        PY4 = [y3(i); y4(i)];
        PX5 = [x4(i); x5(i)];
        PY5 = [y4(i); y5(i)];
    %    quiver(position_x1(i), position_y1(i), velocity_x1(i)/5, velocity_y1(i)/5, 'g');
     %   quiver(position_x1(i), position_y1(i), acceleration_x1(i)/10, acceleration_y1(i)/10, 'r');
%         quiver(position_x2(i), position_y2(i), velocity_x2(i)/5, velocity_y2(i)/5, 'g');
%         quiver(position_x2(i), position_y2(i), acceleration_x2(i)/20, acceleration_y2(i)/20, 'r');
        plot(PX, PY, 'k');
        plot(PX2, PY2, 'k');
        plot(PX3, PY3, 'k');
        plot(PX4, PY4, 'k');
        plot(PX5, PY5, 'k');

%         plot(position_x1(i), position_y1(i), 'm.', 'linewidth', 10, 'markersize', 20);
%         plot(position_x2(i), position_y2(i), 'm.', 'linewidth', 10, 'markersize', 20);
        drawnow; % DO NOT FORGET THIS
        pause(0.0005);
    end
    
    function vals = calc_LHS(Z)
        t1 = Z(1);
        t1d = Z(2);
        t2 = Z(3);
        t2d = Z(4);
        t3 = Z(5);
        t3d = Z(6);
        t4 = Z(7);
        t4d = Z(8);
        t5 = Z(9);
        t5d = Z(10);
        
        
        A = [-M1*(L1/2)*cos(t1), 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0;
             M1*(L1/2)*sin(t1), 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0;
             -M2*L1*cos(t1), -M2*(L2/2)*cos(t2), 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0;
             M2*L1*sin(t1), M2*(L2/2)*sin(t2), 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0;
             -M3*L1*cos(t1), -M3*L2*cos(t2), -M3*(L3/2)*cos(t3), 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0;
             M3*L1*sin(t1), M3*L2*sin(t2), M3*(L3/2)*sin(t3), 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0;
             -M4*L1*cos(t1), -M4*L2*cos(t2), -M4*L3*cos(t3), -M4*(L4/2)*cos(t4), 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0;
             M4*L1*sin(t1), M4*L2*sin(t2), M4*L3*sin(t3), M4*(L4/2)*sin(t4), 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1;
             -M5*L1*cos(t1), -M5*L2*cos(t2), -M5*L3*cos(t3), -M5*L4*cos(t4), -M5*(L2/2)*cos(t5), 0, 0, 0, 0, 0, 0, 0, 0, -1, 0;
             M5*L1*sin(t1), M5*L2*sin(t2), M5*L3*sin(t3), M5*L4*sin(t4), M5*(L5/2)*sin(t5), 0, 0, 0, 0, 0, 0, 0, 0, 0, -1;              
             (-M1*L1^2)/12, 0, 0, 0, 0, -(L1/2)*cos(t1), (L1/2)*sin(t1), (L1/2)*cos(t1), -(L1/2)*sin(t1), 0, 0, 0, 0, 0, 0;
             0, (-M2*L2^2)/12, 0, 0, 0, 0, 0, (L2/2)*cos(t2), -(L2/2)*sin(t2), (L2/2)*cos(t2), -(L2/2)*sin(t2), 0, 0, 0, 0;
             0, 0, (-M3*L3^2)/12, 0, 0, 0, 0, 0, 0, (L3/2)*cos(t3), -(L3/2)*sin(t3),(L3/2)*cos(t3), -(L3/2)*sin(t3), 0, 0;
             0, 0, 0, (-M4*L4^2)/12, 0, 0, 0, 0, 0, 0, 0, (L4/2)*cos(t4), -(L4/2)*sin(t4),(L4/2)*cos(t4), -(L4/2)*sin(t4);
             0, 0, 0, 0, (-M5*L5^2)/12, 0, 0, 0, 0, 0, 0, 0, 0, (L5/2)*cos(t5), -(L5/2)*sin(t5)];
        
        
        r = [-M1*t1d^2*(L1/2)*sin(t1);
            -M1*t1d^2*(L1/2)*cos(t1) - M1*g;
            - M2*t1d^2*L1*sin(t1) - M2*t2d^2*(L2/2)*sin(t2);
            -M2*t1d^2*L1*cos(t1) - M2*t2d^2*(L2/2)*cos(t2) - M2*g;
            -M3*t1d^2*L1*sin(t1) - M3*t2d^2*L2*sin(t2) - M3*t3d^2*(L3/2)*sin(t3);
            -M3*t1d^2*L1*cos(t1) - M3*t2d^2*L2*cos(t2) - M3*t3d^2*(L3/2)*cos(t3) - M3*g;
            -M4*t1d^2*L1*sin(t1) - M4*t2d^2*L2*sin(t2) - M4*t3d^2*L3*sin(t3) - M4*t4d^2*(L4/2)*sin(t4);
            -M4*t1d^2*L1*cos(t1) - M4*t2d^2*L2*cos(t2) - M4*t3d^2*L3*cos(t3) - M4*t4d^2*(L4/2)*cos(t4) - M4*g;
            -M5*t1d^2*L1*sin(t1) - M5*t2d^2*L2*sin(t2) - M5*t3d^2*L3*sin(t3) - M5*t4d^2*L4*sin(t4) - M5*t5d^2*(L5/2)*sin(t5);
            -M5*t1d^2*L1*cos(t1) - M5*t2d^2*L2*cos(t2) - M5*t3d^2*L3*cos(t3) - M5*t4d^2*L4*cos(t4) - M5*t5d^2*(L5/2)*cos(t5) - M5*g;
            0;
            0;
            0;
            0;
            0];
        
        vals = A\r; 
    end

    function vals = motion(T, Z)
        t1d = Z(2);
        t2d = Z(4);
        t3d = Z(6);
        t4d = Z(8);
        t5d = Z(10);

        res = calc_LHS(Z);
        
        t1dd = res(1);
        t2dd = res(2);
        t3dd = res(3);
        t4dd = res(4);
        t5dd = res(5);

        vals = [t1d; t1dd; t2d; t2dd; t3d; t3dd; t4d; t4dd; t5d; t5dd];
        
    end

end
        