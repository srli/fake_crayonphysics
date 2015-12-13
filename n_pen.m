function n_pendulum
close all
L1=1;
L2=1;
L3=1;
L4=1;
L5=1;
L6=1;
L7=1;
L8=1;
L9=1;
L10=1;
L11=1;
L12=1;
L13=1;
L14=1;
L15=1;
L16=1;
L17=1;
L18=1;
L19=1;
L20=1;

M1=1;
M2=1;
M3=1;
M4=1;
M5=1;
M6=1;
M7=1;
M8=1;
M9=1;
M10=1;
M11=1;
M12=1;
M13=1;
M14=1;
M15=1;
M16=1;
M17=1;
M18=1;
M19=1;
M20=1;

g=9.81;

t_interval = 0:0.025:20;
initial_vals = [pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0];

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
t6_o = Z_out(:,11);
t6d_o = Z_out(:,12);
t7_o = Z_out(:,13);
t7d_o = Z_out(:,14);
t8_o = Z_out(:,15);
t8d_o = Z_out(:,16);
t9_o = Z_out(:,17);
t9d_o = Z_out(:,18);
t10_o = Z_out(:,19);
t10d_o = Z_out(:,20);
t11_o = Z_out(:,21);
t11d_o = Z_out(:,22);
t12_o = Z_out(:,23);
t12d_o = Z_out(:,24);
t13_o = Z_out(:,25);
t13d_o = Z_out(:,26);
t14_o = Z_out(:,27);
t14d_o = Z_out(:,28);
t15_o = Z_out(:,29);
t15d_o = Z_out(:,30);
t16_o = Z_out(:,31);
t16d_o = Z_out(:,32);
t17_o = Z_out(:,33);
t17d_o = Z_out(:,34);
t18_o = Z_out(:,35);
t18d_o = Z_out(:,36);
t19_o = Z_out(:,37);
t19d_o = Z_out(:,38);
t20_o = Z_out(:,39);
t20d_o = Z_out(:,40);

LHS = zeros(length(T_out), 60);
for i = 1:length(T_out)
	LHS(i, :) = calc_LHS(Z_out(i, :));
end

t1dd_o = LHS(:,2);
t2dd_o = LHS(:,3);
t3dd_o = LHS(:,4);
t4dd_o = LHS(:,5);
t5dd_o = LHS(:,6);
t6dd_o = LHS(:,7);
t7dd_o = LHS(:,8);
t8dd_o = LHS(:,9);
t9dd_o = LHS(:,10);
t10dd_o = LHS(:,11);
t11dd_o = LHS(:,12);
t12dd_o = LHS(:,13);
t13dd_o = LHS(:,14);
t14dd_o = LHS(:,15);
t15dd_o = LHS(:,16);
t16dd_o = LHS(:,17);
t17dd_o = LHS(:,18);
t18dd_o = LHS(:,19);
t19dd_o = LHS(:,20);
t20dd_o = LHS(:,21);

figure
subplot(3,1,1)
hold all
plot(T_out, t1_o)
plot(T_out, t2_o)
plot(T_out, t3_o)
plot(T_out, t4_o)
plot(T_out, t5_o)
plot(T_out, t6_o)
plot(T_out, t7_o)
plot(T_out, t8_o)
plot(T_out, t9_o)
plot(T_out, t10_o)
plot(T_out, t11_o)
plot(T_out, t12_o)
plot(T_out, t13_o)
plot(T_out, t14_o)
plot(T_out, t15_o)
plot(T_out, t16_o)
plot(T_out, t17_o)
plot(T_out, t18_o)
plot(T_out, t19_o)
plot(T_out, t20_o)
title('Position')
ylabel('Displacement (rad)')
legend('Mass1', 'Mass2', 'Mass3', 'Mass4', 'Mass5', 'Mass6', 'Mass7', 'Mass8', 'Mass9', 'Mass10', 'Mass11', 'Mass12', 'Mass13', 'Mass14', 'Mass15', 'Mass16', 'Mass17', 'Mass18', 'Mass19', 'Mass20')

subplot(3,1,2)
hold all
plot(T_out, t1d_o)
plot(T_out, t2d_o)
plot(T_out, t3d_o)
plot(T_out, t4d_o)
plot(T_out, t5d_o)
plot(T_out, t6d_o)
plot(T_out, t7d_o)
plot(T_out, t8d_o)
plot(T_out, t9d_o)
plot(T_out, t10d_o)
plot(T_out, t11d_o)
plot(T_out, t12d_o)
plot(T_out, t13d_o)
plot(T_out, t14d_o)
plot(T_out, t15d_o)
plot(T_out, t16d_o)
plot(T_out, t17d_o)
plot(T_out, t18d_o)
plot(T_out, t19d_o)
plot(T_out, t20d_o)
title('Velocity')
ylabel('Velocity (rad/s)')
legend('Mass1', 'Mass2', 'Mass3', 'Mass4', 'Mass5', 'Mass6', 'Mass7', 'Mass8', 'Mass9', 'Mass10', 'Mass11', 'Mass12', 'Mass13', 'Mass14', 'Mass15', 'Mass16', 'Mass17', 'Mass18', 'Mass19', 'Mass20')

subplot(3,1,3)
hold all
plot(T_out, t1dd_o)
plot(T_out, t2dd_o)
plot(T_out, t3dd_o)
plot(T_out, t4dd_o)
plot(T_out, t5dd_o)
plot(T_out, t6dd_o)
plot(T_out, t7dd_o)
plot(T_out, t8dd_o)
plot(T_out, t9dd_o)
plot(T_out, t10dd_o)
plot(T_out, t11dd_o)
plot(T_out, t12dd_o)
plot(T_out, t13dd_o)
plot(T_out, t14dd_o)
plot(T_out, t15dd_o)
plot(T_out, t16dd_o)
plot(T_out, t17dd_o)
plot(T_out, t18dd_o)
plot(T_out, t19dd_o)
plot(T_out, t20dd_o)
title('Acceleration')
xlabel('Time (s)')
ylabel('Acceleration (rad/s^2)')
legend('Mass1', 'Mass2', 'Mass3', 'Mass4', 'Mass5', 'Mass6', 'Mass7', 'Mass8', 'Mass9', 'Mass10', 'Mass11', 'Mass12', 'Mass13', 'Mass14', 'Mass15', 'Mass16', 'Mass17', 'Mass18', 'Mass19', 'Mass20')

x1 = +(L1/2).*sin(t1_o);
y1 = -(L1/2).*cos(t1_o);
xv1 = +(L1/2).*cos(t1_o).*t1d_o;
yv1 = +(L1/2).*sin(t1_o).*t1d_o;

x2 = +L1.*sin(t1_o)+(L2/2).*sin(t2_o);
y2 = -L1.*cos(t1_o)-(L2/2).*cos(t2_o);
xv2 = +L1.*cos(t1_o).*t1d_o+(L2/2).*cos(t2_o).*t2d_o;
yv2 = +L1.*sin(t1_o).*t1d_o+(L2/2).*sin(t2_o).*t2d_o;

x3 = +L1.*sin(t1_o)+L2.*sin(t2_o)+(L3/2).*sin(t3_o);
y3 = -L1.*cos(t1_o)-L2.*cos(t2_o)-(L3/2).*cos(t3_o);
xv3 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+(L3/2).*cos(t3_o).*t3d_o;
yv3 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+(L3/2).*sin(t3_o).*t3d_o;

x4 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+(L4/2).*sin(t4_o);
y4 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-(L4/2).*cos(t4_o);
xv4 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+(L4/2).*cos(t4_o).*t4d_o;
yv4 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+(L4/2).*sin(t4_o).*t4d_o;

x5 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+(L5/2).*sin(t5_o);
y5 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-(L5/2).*cos(t5_o);
xv5 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+(L5/2).*cos(t5_o).*t5d_o;
yv5 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+(L5/2).*sin(t5_o).*t5d_o;

x6 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+(L6/2).*sin(t6_o);
y6 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-(L6/2).*cos(t6_o);
xv6 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+(L6/2).*cos(t6_o).*t6d_o;
yv6 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+(L6/2).*sin(t6_o).*t6d_o;

x7 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+(L7/2).*sin(t7_o);
y7 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-(L7/2).*cos(t7_o);
xv7 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+(L7/2).*cos(t7_o).*t7d_o;
yv7 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+(L7/2).*sin(t7_o).*t7d_o;

x8 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+(L8/2).*sin(t8_o);
y8 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-(L8/2).*cos(t8_o);
xv8 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+(L8/2).*cos(t8_o).*t8d_o;
yv8 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+(L8/2).*sin(t8_o).*t8d_o;

x9 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+(L9/2).*sin(t9_o);
y9 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-(L9/2).*cos(t9_o);
xv9 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+L8.*cos(t8_o).*t8d_o+(L9/2).*cos(t9_o).*t9d_o;
yv9 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+L8.*sin(t8_o).*t8d_o+(L9/2).*sin(t9_o).*t9d_o;

x10 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+(L10/2).*sin(t10_o);
y10 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-(L10/2).*cos(t10_o);
xv10 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+L8.*cos(t8_o).*t8d_o+L9.*cos(t9_o).*t9d_o+(L10/2).*cos(t10_o).*t10d_o;
yv10 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+L8.*sin(t8_o).*t8d_o+L9.*sin(t9_o).*t9d_o+(L10/2).*sin(t10_o).*t10d_o;

x11 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+(L11/2).*sin(t11_o);
y11 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-(L11/2).*cos(t11_o);
xv11 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+L8.*cos(t8_o).*t8d_o+L9.*cos(t9_o).*t9d_o+L10.*cos(t10_o).*t10d_o+(L11/2).*cos(t11_o).*t11d_o;
yv11 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+L8.*sin(t8_o).*t8d_o+L9.*sin(t9_o).*t9d_o+L10.*sin(t10_o).*t10d_o+(L11/2).*sin(t11_o).*t11d_o;

x12 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+(L12/2).*sin(t12_o);
y12 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-(L12/2).*cos(t12_o);
xv12 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+L8.*cos(t8_o).*t8d_o+L9.*cos(t9_o).*t9d_o+L10.*cos(t10_o).*t10d_o+L11.*cos(t11_o).*t11d_o+(L12/2).*cos(t12_o).*t12d_o;
yv12 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+L8.*sin(t8_o).*t8d_o+L9.*sin(t9_o).*t9d_o+L10.*sin(t10_o).*t10d_o+L11.*sin(t11_o).*t11d_o+(L12/2).*sin(t12_o).*t12d_o;

x13 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+(L13/2).*sin(t13_o);
y13 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-(L13/2).*cos(t13_o);
xv13 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+L8.*cos(t8_o).*t8d_o+L9.*cos(t9_o).*t9d_o+L10.*cos(t10_o).*t10d_o+L11.*cos(t11_o).*t11d_o+L12.*cos(t12_o).*t12d_o+(L13/2).*cos(t13_o).*t13d_o;
yv13 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+L8.*sin(t8_o).*t8d_o+L9.*sin(t9_o).*t9d_o+L10.*sin(t10_o).*t10d_o+L11.*sin(t11_o).*t11d_o+L12.*sin(t12_o).*t12d_o+(L13/2).*sin(t13_o).*t13d_o;

x14 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+(L14/2).*sin(t14_o);
y14 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-(L14/2).*cos(t14_o);
xv14 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+L8.*cos(t8_o).*t8d_o+L9.*cos(t9_o).*t9d_o+L10.*cos(t10_o).*t10d_o+L11.*cos(t11_o).*t11d_o+L12.*cos(t12_o).*t12d_o+L13.*cos(t13_o).*t13d_o+(L14/2).*cos(t14_o).*t14d_o;
yv14 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+L8.*sin(t8_o).*t8d_o+L9.*sin(t9_o).*t9d_o+L10.*sin(t10_o).*t10d_o+L11.*sin(t11_o).*t11d_o+L12.*sin(t12_o).*t12d_o+L13.*sin(t13_o).*t13d_o+(L14/2).*sin(t14_o).*t14d_o;

x15 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o)+(L15/2).*sin(t15_o);
y15 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o)-(L15/2).*cos(t15_o);
xv15 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+L8.*cos(t8_o).*t8d_o+L9.*cos(t9_o).*t9d_o+L10.*cos(t10_o).*t10d_o+L11.*cos(t11_o).*t11d_o+L12.*cos(t12_o).*t12d_o+L13.*cos(t13_o).*t13d_o+L14.*cos(t14_o).*t14d_o+(L15/2).*cos(t15_o).*t15d_o;
yv15 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+L8.*sin(t8_o).*t8d_o+L9.*sin(t9_o).*t9d_o+L10.*sin(t10_o).*t10d_o+L11.*sin(t11_o).*t11d_o+L12.*sin(t12_o).*t12d_o+L13.*sin(t13_o).*t13d_o+L14.*sin(t14_o).*t14d_o+(L15/2).*sin(t15_o).*t15d_o;

x16 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o)+L15.*sin(t15_o)+(L16/2).*sin(t16_o);
y16 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o)-L15.*cos(t15_o)-(L16/2).*cos(t16_o);
xv16 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+L8.*cos(t8_o).*t8d_o+L9.*cos(t9_o).*t9d_o+L10.*cos(t10_o).*t10d_o+L11.*cos(t11_o).*t11d_o+L12.*cos(t12_o).*t12d_o+L13.*cos(t13_o).*t13d_o+L14.*cos(t14_o).*t14d_o+L15.*cos(t15_o).*t15d_o+(L16/2).*cos(t16_o).*t16d_o;
yv16 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+L8.*sin(t8_o).*t8d_o+L9.*sin(t9_o).*t9d_o+L10.*sin(t10_o).*t10d_o+L11.*sin(t11_o).*t11d_o+L12.*sin(t12_o).*t12d_o+L13.*sin(t13_o).*t13d_o+L14.*sin(t14_o).*t14d_o+L15.*sin(t15_o).*t15d_o+(L16/2).*sin(t16_o).*t16d_o;

x17 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o)+L15.*sin(t15_o)+L16.*sin(t16_o)+(L17/2).*sin(t17_o);
y17 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o)-L15.*cos(t15_o)-L16.*cos(t16_o)-(L17/2).*cos(t17_o);
xv17 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+L8.*cos(t8_o).*t8d_o+L9.*cos(t9_o).*t9d_o+L10.*cos(t10_o).*t10d_o+L11.*cos(t11_o).*t11d_o+L12.*cos(t12_o).*t12d_o+L13.*cos(t13_o).*t13d_o+L14.*cos(t14_o).*t14d_o+L15.*cos(t15_o).*t15d_o+L16.*cos(t16_o).*t16d_o+(L17/2).*cos(t17_o).*t17d_o;
yv17 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+L8.*sin(t8_o).*t8d_o+L9.*sin(t9_o).*t9d_o+L10.*sin(t10_o).*t10d_o+L11.*sin(t11_o).*t11d_o+L12.*sin(t12_o).*t12d_o+L13.*sin(t13_o).*t13d_o+L14.*sin(t14_o).*t14d_o+L15.*sin(t15_o).*t15d_o+L16.*sin(t16_o).*t16d_o+(L17/2).*sin(t17_o).*t17d_o;

x18 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o)+L15.*sin(t15_o)+L16.*sin(t16_o)+L17.*sin(t17_o)+(L18/2).*sin(t18_o);
y18 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o)-L15.*cos(t15_o)-L16.*cos(t16_o)-L17.*cos(t17_o)-(L18/2).*cos(t18_o);
xv18 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+L8.*cos(t8_o).*t8d_o+L9.*cos(t9_o).*t9d_o+L10.*cos(t10_o).*t10d_o+L11.*cos(t11_o).*t11d_o+L12.*cos(t12_o).*t12d_o+L13.*cos(t13_o).*t13d_o+L14.*cos(t14_o).*t14d_o+L15.*cos(t15_o).*t15d_o+L16.*cos(t16_o).*t16d_o+L17.*cos(t17_o).*t17d_o+(L18/2).*cos(t18_o).*t18d_o;
yv18 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+L8.*sin(t8_o).*t8d_o+L9.*sin(t9_o).*t9d_o+L10.*sin(t10_o).*t10d_o+L11.*sin(t11_o).*t11d_o+L12.*sin(t12_o).*t12d_o+L13.*sin(t13_o).*t13d_o+L14.*sin(t14_o).*t14d_o+L15.*sin(t15_o).*t15d_o+L16.*sin(t16_o).*t16d_o+L17.*sin(t17_o).*t17d_o+(L18/2).*sin(t18_o).*t18d_o;

x19 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o)+L15.*sin(t15_o)+L16.*sin(t16_o)+L17.*sin(t17_o)+L18.*sin(t18_o)+(L19/2).*sin(t19_o);
y19 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o)-L15.*cos(t15_o)-L16.*cos(t16_o)-L17.*cos(t17_o)-L18.*cos(t18_o)-(L19/2).*cos(t19_o);
xv19 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+L8.*cos(t8_o).*t8d_o+L9.*cos(t9_o).*t9d_o+L10.*cos(t10_o).*t10d_o+L11.*cos(t11_o).*t11d_o+L12.*cos(t12_o).*t12d_o+L13.*cos(t13_o).*t13d_o+L14.*cos(t14_o).*t14d_o+L15.*cos(t15_o).*t15d_o+L16.*cos(t16_o).*t16d_o+L17.*cos(t17_o).*t17d_o+L18.*cos(t18_o).*t18d_o+(L19/2).*cos(t19_o).*t19d_o;
yv19 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+L8.*sin(t8_o).*t8d_o+L9.*sin(t9_o).*t9d_o+L10.*sin(t10_o).*t10d_o+L11.*sin(t11_o).*t11d_o+L12.*sin(t12_o).*t12d_o+L13.*sin(t13_o).*t13d_o+L14.*sin(t14_o).*t14d_o+L15.*sin(t15_o).*t15d_o+L16.*sin(t16_o).*t16d_o+L17.*sin(t17_o).*t17d_o+L18.*sin(t18_o).*t18d_o+(L19/2).*sin(t19_o).*t19d_o;

x20 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o)+L15.*sin(t15_o)+L16.*sin(t16_o)+L17.*sin(t17_o)+L18.*sin(t18_o)+L19.*sin(t19_o)+(L20/2).*sin(t20_o);
y20 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o)-L15.*cos(t15_o)-L16.*cos(t16_o)-L17.*cos(t17_o)-L18.*cos(t18_o)-L19.*cos(t19_o)-(L20/2).*cos(t20_o);
xv20 = +L1.*cos(t1_o).*t1d_o+L2.*cos(t2_o).*t2d_o+L3.*cos(t3_o).*t3d_o+L4.*cos(t4_o).*t4d_o+L5.*cos(t5_o).*t5d_o+L6.*cos(t6_o).*t6d_o+L7.*cos(t7_o).*t7d_o+L8.*cos(t8_o).*t8d_o+L9.*cos(t9_o).*t9d_o+L10.*cos(t10_o).*t10d_o+L11.*cos(t11_o).*t11d_o+L12.*cos(t12_o).*t12d_o+L13.*cos(t13_o).*t13d_o+L14.*cos(t14_o).*t14d_o+L15.*cos(t15_o).*t15d_o+L16.*cos(t16_o).*t16d_o+L17.*cos(t17_o).*t17d_o+L18.*cos(t18_o).*t18d_o+L19.*cos(t19_o).*t19d_o+(L20/2).*cos(t20_o).*t20d_o;
yv20 = +L1.*sin(t1_o).*t1d_o+L2.*sin(t2_o).*t2d_o+L3.*sin(t3_o).*t3d_o+L4.*sin(t4_o).*t4d_o+L5.*sin(t5_o).*t5d_o+L6.*sin(t6_o).*t6d_o+L7.*sin(t7_o).*t7d_o+L8.*sin(t8_o).*t8d_o+L9.*sin(t9_o).*t9d_o+L10.*sin(t10_o).*t10d_o+L11.*sin(t11_o).*t11d_o+L12.*sin(t12_o).*t12d_o+L13.*sin(t13_o).*t13d_o+L14.*sin(t14_o).*t14d_o+L15.*sin(t15_o).*t15d_o+L16.*sin(t16_o).*t16d_o+L17.*sin(t17_o).*t17d_o+L18.*sin(t18_o).*t18d_o+L19.*sin(t19_o).*t19d_o+(L20/2).*sin(t20_o).*t20d_o;


PE1 = M1*g.*y1;
KE1 = (M1/2)*((xv1.^2 + yv1.^2)) + t1d_o.^2*((L1^2/12));
PE2 = M2*g.*y2;
KE2 = (M2/2)*((xv2.^2 + yv2.^2)) + t2d_o.^2*((L2^2/12));
PE3 = M3*g.*y3;
KE3 = (M3/2)*((xv3.^2 + yv3.^2)) + t3d_o.^2*((L3^2/12));
PE4 = M4*g.*y4;
KE4 = (M4/2)*((xv4.^2 + yv4.^2)) + t4d_o.^2*((L4^2/12));
PE5 = M5*g.*y5;
KE5 = (M5/2)*((xv5.^2 + yv5.^2)) + t5d_o.^2*((L5^2/12));
PE6 = M6*g.*y6;
KE6 = (M6/2)*((xv6.^2 + yv6.^2)) + t6d_o.^2*((L6^2/12));
PE7 = M7*g.*y7;
KE7 = (M7/2)*((xv7.^2 + yv7.^2)) + t7d_o.^2*((L7^2/12));
PE8 = M8*g.*y8;
KE8 = (M8/2)*((xv8.^2 + yv8.^2)) + t8d_o.^2*((L8^2/12));
PE9 = M9*g.*y9;
KE9 = (M9/2)*((xv9.^2 + yv9.^2)) + t9d_o.^2*((L9^2/12));
PE10 = M10*g.*y10;
KE10 = (M10/2)*((xv10.^2 + yv10.^2)) + t10d_o.^2*((L10^2/12));
PE11 = M11*g.*y11;
KE11 = (M11/2)*((xv11.^2 + yv11.^2)) + t11d_o.^2*((L11^2/12));
PE12 = M12*g.*y12;
KE12 = (M12/2)*((xv12.^2 + yv12.^2)) + t12d_o.^2*((L12^2/12));
PE13 = M13*g.*y13;
KE13 = (M13/2)*((xv13.^2 + yv13.^2)) + t13d_o.^2*((L13^2/12));
PE14 = M14*g.*y14;
KE14 = (M14/2)*((xv14.^2 + yv14.^2)) + t14d_o.^2*((L14^2/12));
PE15 = M15*g.*y15;
KE15 = (M15/2)*((xv15.^2 + yv15.^2)) + t15d_o.^2*((L15^2/12));
PE16 = M16*g.*y16;
KE16 = (M16/2)*((xv16.^2 + yv16.^2)) + t16d_o.^2*((L16^2/12));
PE17 = M17*g.*y17;
KE17 = (M17/2)*((xv17.^2 + yv17.^2)) + t17d_o.^2*((L17^2/12));
PE18 = M18*g.*y18;
KE18 = (M18/2)*((xv18.^2 + yv18.^2)) + t18d_o.^2*((L18^2/12));
PE19 = M19*g.*y19;
KE19 = (M19/2)*((xv19.^2 + yv19.^2)) + t19d_o.^2*((L19^2/12));
PE20 = M20*g.*y20;
KE20 = (M20/2)*((xv20.^2 + yv20.^2)) + t20d_o.^2*((L20^2/12));

PE = +PE1+PE2+PE3+PE4+PE5+PE6+PE7+PE8+PE9+PE10+PE11+PE12+PE13+PE14+PE15+PE16+PE17+PE18+PE19+PE20;
KE = +KE1+KE2+KE3+KE4+KE5+KE6+KE7+KE8+KE9+KE10+KE11+KE12+KE13+KE14+KE15+KE16+KE17+KE18+KE19+KE20;
TE = PE + KE;
figure
hold all
plot(T_out, PE);
plot(T_out, KE);
plot(T_out, TE);
title('Total Energy')
xlabel('Time (s)')
ylabel('Energy (J)')
legend('PE', 'KE', 'TE')

x1 = +L1.*sin(t1_o);
y1 = -L1.*cos(t1_o);

x2 = +L1.*sin(t1_o)+L2.*sin(t2_o);
y2 = -L1.*cos(t1_o)-L2.*cos(t2_o);

x3 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o);
y3 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o);

x4 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o);
y4 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o);

x5 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o);
y5 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o);

x6 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o);
y6 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o);

x7 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o);
y7 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o);

x8 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o);
y8 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o);

x9 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o);
y9 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o);

x10 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o);
y10 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o);

x11 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o);
y11 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o);

x12 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o);
y12 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o);

x13 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o);
y13 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o);

x14 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o);
y14 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o);

x15 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o)+L15.*sin(t15_o);
y15 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o)-L15.*cos(t15_o);

x16 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o)+L15.*sin(t15_o)+L16.*sin(t16_o);
y16 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o)-L15.*cos(t15_o)-L16.*cos(t16_o);

x17 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o)+L15.*sin(t15_o)+L16.*sin(t16_o)+L17.*sin(t17_o);
y17 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o)-L15.*cos(t15_o)-L16.*cos(t16_o)-L17.*cos(t17_o);

x18 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o)+L15.*sin(t15_o)+L16.*sin(t16_o)+L17.*sin(t17_o)+L18.*sin(t18_o);
y18 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o)-L15.*cos(t15_o)-L16.*cos(t16_o)-L17.*cos(t17_o)-L18.*cos(t18_o);

x19 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o)+L15.*sin(t15_o)+L16.*sin(t16_o)+L17.*sin(t17_o)+L18.*sin(t18_o)+L19.*sin(t19_o);
y19 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o)-L15.*cos(t15_o)-L16.*cos(t16_o)-L17.*cos(t17_o)-L18.*cos(t18_o)-L19.*cos(t19_o);

x20 = +L1.*sin(t1_o)+L2.*sin(t2_o)+L3.*sin(t3_o)+L4.*sin(t4_o)+L5.*sin(t5_o)+L6.*sin(t6_o)+L7.*sin(t7_o)+L8.*sin(t8_o)+L9.*sin(t9_o)+L10.*sin(t10_o)+L11.*sin(t11_o)+L12.*sin(t12_o)+L13.*sin(t13_o)+L14.*sin(t14_o)+L15.*sin(t15_o)+L16.*sin(t16_o)+L17.*sin(t17_o)+L18.*sin(t18_o)+L19.*sin(t19_o)+L20.*sin(t20_o);
y20 = -L1.*cos(t1_o)-L2.*cos(t2_o)-L3.*cos(t3_o)-L4.*cos(t4_o)-L5.*cos(t5_o)-L6.*cos(t6_o)-L7.*cos(t7_o)-L8.*cos(t8_o)-L9.*cos(t9_o)-L10.*cos(t10_o)-L11.*cos(t11_o)-L12.*cos(t12_o)-L13.*cos(t13_o)-L14.*cos(t14_o)-L15.*cos(t15_o)-L16.*cos(t16_o)-L17.*cos(t17_o)-L18.*cos(t18_o)-L19.*cos(t19_o)-L20.*cos(t20_o);

v = VideoWriter('n20_pen.avi');
open(v);

figure
for i = 1:length(T_out)
	clf;
	axis([-5 5 -5 5]);
	hold all
	PX1 = [0; x1(i)];
	PY1 = [0; y1(i)];

	plot(PX1, PY1, 'k');
	PX2 = [x1(i); x2(i)];
	PY2 = [y1(i); y2(i)];

	plot(PX2, PY2, 'k');
	PX3 = [x2(i); x3(i)];
	PY3 = [y2(i); y3(i)];

	plot(PX3, PY3, 'k');
	PX4 = [x3(i); x4(i)];
	PY4 = [y3(i); y4(i)];

	plot(PX4, PY4, 'k');
	PX5 = [x4(i); x5(i)];
	PY5 = [y4(i); y5(i)];

	plot(PX5, PY5, 'k');
	PX6 = [x5(i); x6(i)];
	PY6 = [y5(i); y6(i)];

	plot(PX6, PY6, 'k');
	PX7 = [x6(i); x7(i)];
	PY7 = [y6(i); y7(i)];

	plot(PX7, PY7, 'k');
	PX8 = [x7(i); x8(i)];
	PY8 = [y7(i); y8(i)];

	plot(PX8, PY8, 'k');
	PX9 = [x8(i); x9(i)];
	PY9 = [y8(i); y9(i)];

	plot(PX9, PY9, 'k');
	PX10 = [x9(i); x10(i)];
	PY10 = [y9(i); y10(i)];

	plot(PX10, PY10, 'k');
	PX11 = [x10(i); x11(i)];
	PY11 = [y10(i); y11(i)];

	plot(PX11, PY11, 'k');
	PX12 = [x11(i); x12(i)];
	PY12 = [y11(i); y12(i)];

	plot(PX12, PY12, 'k');
	PX13 = [x12(i); x13(i)];
	PY13 = [y12(i); y13(i)];

	plot(PX13, PY13, 'k');
	PX14 = [x13(i); x14(i)];
	PY14 = [y13(i); y14(i)];

	plot(PX14, PY14, 'k');
	PX15 = [x14(i); x15(i)];
	PY15 = [y14(i); y15(i)];

	plot(PX15, PY15, 'k');
	PX16 = [x15(i); x16(i)];
	PY16 = [y15(i); y16(i)];

	plot(PX16, PY16, 'k');
	PX17 = [x16(i); x17(i)];
	PY17 = [y16(i); y17(i)];

	plot(PX17, PY17, 'k');
	PX18 = [x17(i); x18(i)];
	PY18 = [y17(i); y18(i)];

	plot(PX18, PY18, 'k');
	PX19 = [x18(i); x19(i)];
	PY19 = [y18(i); y19(i)];

	plot(PX19, PY19, 'k');
	PX20 = [x19(i); x20(i)];
	PY20 = [y19(i); y20(i)];

	plot(PX20, PY20, 'k');
	drawnow;
	pause(0.0005);
	frame = getframe;
	writeVideo(v, frame);
end
function res = calc_LHS(Z)
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
	t6 = Z(11);
	t6d = Z(12);
	t7 = Z(13);
	t7d = Z(14);
	t8 = Z(15);
	t8d = Z(16);
	t9 = Z(17);
	t9d = Z(18);
	t10 = Z(19);
	t10d = Z(20);
	t11 = Z(21);
	t11d = Z(22);
	t12 = Z(23);
	t12d = Z(24);
	t13 = Z(25);
	t13d = Z(26);
	t14 = Z(27);
	t14d = Z(28);
	t15 = Z(29);
	t15d = Z(30);
	t16 = Z(31);
	t16d = Z(32);
	t17 = Z(33);
	t17d = Z(34);
	t18 = Z(35);
	t18d = Z(36);
	t19 = Z(37);
	t19d = Z(38);
	t20 = Z(39);
	t20d = Z(40);

	A = [
		-M1*(L1/2)*cos(t1), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M1*(L1/2)*sin(t1), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M1*L1^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L1/2)*cos(t1), -(L1/2)*sin(t1), (L1/2)*cos(t1), -(L1/2)*sin(t1), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M2*L1*cos(t1), -M2*(L2/2)*cos(t2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M2*L1*sin(t1), M2*(L2/2)*sin(t2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, -M2*L2^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L2/2)*cos(t2), -(L2/2)*sin(t2), (L2/2)*cos(t2), -(L2/2)*sin(t2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M3*L1*cos(t1), -M3*L2*cos(t2), -M3*(L3/2)*cos(t3), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M3*L1*sin(t1), M3*L2*sin(t2), M3*(L3/2)*sin(t3), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, -M3*L3^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L3/2)*cos(t3), -(L3/2)*sin(t3), (L3/2)*cos(t3), -(L3/2)*sin(t3), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M4*L1*cos(t1), -M4*L2*cos(t2), -M4*L3*cos(t3), -M4*(L4/2)*cos(t4), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M4*L1*sin(t1), M4*L2*sin(t2), M4*L3*sin(t3), M4*(L4/2)*sin(t4), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, 0, -M4*L4^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L4/2)*cos(t4), -(L4/2)*sin(t4), (L4/2)*cos(t4), -(L4/2)*sin(t4), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M5*L1*cos(t1), -M5*L2*cos(t2), -M5*L3*cos(t3), -M5*L4*cos(t4), -M5*(L5/2)*cos(t5), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M5*L1*sin(t1), M5*L2*sin(t2), M5*L3*sin(t3), M5*L4*sin(t4), M5*(L5/2)*sin(t5), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, 0, 0, -M5*L5^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L5/2)*cos(t5), -(L5/2)*sin(t5), (L5/2)*cos(t5), -(L5/2)*sin(t5), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M6*L1*cos(t1), -M6*L2*cos(t2), -M6*L3*cos(t3), -M6*L4*cos(t4), -M6*L5*cos(t5), -M6*(L6/2)*cos(t6), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M6*L1*sin(t1), M6*L2*sin(t2), M6*L3*sin(t3), M6*L4*sin(t4), M6*L5*sin(t5), M6*(L6/2)*sin(t6), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, 0, 0, 0, -M6*L6^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L6/2)*cos(t6), -(L6/2)*sin(t6), (L6/2)*cos(t6), -(L6/2)*sin(t6), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M7*L1*cos(t1), -M7*L2*cos(t2), -M7*L3*cos(t3), -M7*L4*cos(t4), -M7*L5*cos(t5), -M7*L6*cos(t6), -M7*(L7/2)*cos(t7), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M7*L1*sin(t1), M7*L2*sin(t2), M7*L3*sin(t3), M7*L4*sin(t4), M7*L5*sin(t5), M7*L6*sin(t6), M7*(L7/2)*sin(t7), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, 0, 0, 0, 0, -M7*L7^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L7/2)*cos(t7), -(L7/2)*sin(t7), (L7/2)*cos(t7), -(L7/2)*sin(t7), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M8*L1*cos(t1), -M8*L2*cos(t2), -M8*L3*cos(t3), -M8*L4*cos(t4), -M8*L5*cos(t5), -M8*L6*cos(t6), -M8*L7*cos(t7), -M8*(L8/2)*cos(t8), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M8*L1*sin(t1), M8*L2*sin(t2), M8*L3*sin(t3), M8*L4*sin(t4), M8*L5*sin(t5), M8*L6*sin(t6), M8*L7*sin(t7), M8*(L8/2)*sin(t8), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, 0, 0, 0, 0, 0, -M8*L8^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L8/2)*cos(t8), -(L8/2)*sin(t8), (L8/2)*cos(t8), -(L8/2)*sin(t8), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M9*L1*cos(t1), -M9*L2*cos(t2), -M9*L3*cos(t3), -M9*L4*cos(t4), -M9*L5*cos(t5), -M9*L6*cos(t6), -M9*L7*cos(t7), -M9*L8*cos(t8), -M9*(L9/2)*cos(t9), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M9*L1*sin(t1), M9*L2*sin(t2), M9*L3*sin(t3), M9*L4*sin(t4), M9*L5*sin(t5), M9*L6*sin(t6), M9*L7*sin(t7), M9*L8*sin(t8), M9*(L9/2)*sin(t9), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, 0, 0, 0, 0, 0, 0, -M9*L9^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L9/2)*cos(t9), -(L9/2)*sin(t9), (L9/2)*cos(t9), -(L9/2)*sin(t9), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M10*L1*cos(t1), -M10*L2*cos(t2), -M10*L3*cos(t3), -M10*L4*cos(t4), -M10*L5*cos(t5), -M10*L6*cos(t6), -M10*L7*cos(t7), -M10*L8*cos(t8), -M10*L9*cos(t9), -M10*(L10/2)*cos(t10), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M10*L1*sin(t1), M10*L2*sin(t2), M10*L3*sin(t3), M10*L4*sin(t4), M10*L5*sin(t5), M10*L6*sin(t6), M10*L7*sin(t7), M10*L8*sin(t8), M10*L9*sin(t9), M10*(L10/2)*sin(t10), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, 0, 0, 0, 0, 0, 0, 0, -M10*L10^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L10/2)*cos(t10), -(L10/2)*sin(t10), (L10/2)*cos(t10), -(L10/2)*sin(t10), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M11*L1*cos(t1), -M11*L2*cos(t2), -M11*L3*cos(t3), -M11*L4*cos(t4), -M11*L5*cos(t5), -M11*L6*cos(t6), -M11*L7*cos(t7), -M11*L8*cos(t8), -M11*L9*cos(t9), -M11*L10*cos(t10), -M11*(L11/2)*cos(t11), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M11*L1*sin(t1), M11*L2*sin(t2), M11*L3*sin(t3), M11*L4*sin(t4), M11*L5*sin(t5), M11*L6*sin(t6), M11*L7*sin(t7), M11*L8*sin(t8), M11*L9*sin(t9), M11*L10*sin(t10), M11*(L11/2)*sin(t11), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -M11*L11^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L11/2)*cos(t11), -(L11/2)*sin(t11), (L11/2)*cos(t11), -(L11/2)*sin(t11), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M12*L1*cos(t1), -M12*L2*cos(t2), -M12*L3*cos(t3), -M12*L4*cos(t4), -M12*L5*cos(t5), -M12*L6*cos(t6), -M12*L7*cos(t7), -M12*L8*cos(t8), -M12*L9*cos(t9), -M12*L10*cos(t10), -M12*L11*cos(t11), -M12*(L12/2)*cos(t12), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M12*L1*sin(t1), M12*L2*sin(t2), M12*L3*sin(t3), M12*L4*sin(t4), M12*L5*sin(t5), M12*L6*sin(t6), M12*L7*sin(t7), M12*L8*sin(t8), M12*L9*sin(t9), M12*L10*sin(t10), M12*L11*sin(t11), M12*(L12/2)*sin(t12), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -M12*L12^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L12/2)*cos(t12), -(L12/2)*sin(t12), (L12/2)*cos(t12), -(L12/2)*sin(t12), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M13*L1*cos(t1), -M13*L2*cos(t2), -M13*L3*cos(t3), -M13*L4*cos(t4), -M13*L5*cos(t5), -M13*L6*cos(t6), -M13*L7*cos(t7), -M13*L8*cos(t8), -M13*L9*cos(t9), -M13*L10*cos(t10), -M13*L11*cos(t11), -M13*L12*cos(t12), -M13*(L13/2)*cos(t13), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M13*L1*sin(t1), M13*L2*sin(t2), M13*L3*sin(t3), M13*L4*sin(t4), M13*L5*sin(t5), M13*L6*sin(t6), M13*L7*sin(t7), M13*L8*sin(t8), M13*L9*sin(t9), M13*L10*sin(t10), M13*L11*sin(t11), M13*L12*sin(t12), M13*(L13/2)*sin(t13), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -M13*L13^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L13/2)*cos(t13), -(L13/2)*sin(t13), (L13/2)*cos(t13), -(L13/2)*sin(t13), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M14*L1*cos(t1), -M14*L2*cos(t2), -M14*L3*cos(t3), -M14*L4*cos(t4), -M14*L5*cos(t5), -M14*L6*cos(t6), -M14*L7*cos(t7), -M14*L8*cos(t8), -M14*L9*cos(t9), -M14*L10*cos(t10), -M14*L11*cos(t11), -M14*L12*cos(t12), -M14*L13*cos(t13), -M14*(L14/2)*cos(t14), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M14*L1*sin(t1), M14*L2*sin(t2), M14*L3*sin(t3), M14*L4*sin(t4), M14*L5*sin(t5), M14*L6*sin(t6), M14*L7*sin(t7), M14*L8*sin(t8), M14*L9*sin(t9), M14*L10*sin(t10), M14*L11*sin(t11), M14*L12*sin(t12), M14*L13*sin(t13), M14*(L14/2)*sin(t14), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -M14*L14^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L14/2)*cos(t14), -(L14/2)*sin(t14), (L14/2)*cos(t14), -(L14/2)*sin(t14), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		-M15*L1*cos(t1), -M15*L2*cos(t2), -M15*L3*cos(t3), -M15*L4*cos(t4), -M15*L5*cos(t5), -M15*L6*cos(t6), -M15*L7*cos(t7), -M15*L8*cos(t8), -M15*L9*cos(t9), -M15*L10*cos(t10), -M15*L11*cos(t11), -M15*L12*cos(t12), -M15*L13*cos(t13), -M15*L14*cos(t14), -M15*(L15/2)*cos(t15), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0;
		M15*L1*sin(t1), M15*L2*sin(t2), M15*L3*sin(t3), M15*L4*sin(t4), M15*L5*sin(t5), M15*L6*sin(t6), M15*L7*sin(t7), M15*L8*sin(t8), M15*L9*sin(t9), M15*L10*sin(t10), M15*L11*sin(t11), M15*L12*sin(t12), M15*L13*sin(t13), M15*L14*sin(t14), M15*(L15/2)*sin(t15), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0;
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -M15*L15^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L15/2)*cos(t15), -(L15/2)*sin(t15), (L15/2)*cos(t15), -(L15/2)*sin(t15), 0, 0, 0, 0, 0, 0, 0, 0;
		-M16*L1*cos(t1), -M16*L2*cos(t2), -M16*L3*cos(t3), -M16*L4*cos(t4), -M16*L5*cos(t5), -M16*L6*cos(t6), -M16*L7*cos(t7), -M16*L8*cos(t8), -M16*L9*cos(t9), -M16*L10*cos(t10), -M16*L11*cos(t11), -M16*L12*cos(t12), -M16*L13*cos(t13), -M16*L14*cos(t14), -M16*L15*cos(t15), -M16*(L16/2)*cos(t16), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0;
		M16*L1*sin(t1), M16*L2*sin(t2), M16*L3*sin(t3), M16*L4*sin(t4), M16*L5*sin(t5), M16*L6*sin(t6), M16*L7*sin(t7), M16*L8*sin(t8), M16*L9*sin(t9), M16*L10*sin(t10), M16*L11*sin(t11), M16*L12*sin(t12), M16*L13*sin(t13), M16*L14*sin(t14), M16*L15*sin(t15), M16*(L16/2)*sin(t16), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0;
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -M16*L16^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L16/2)*cos(t16), -(L16/2)*sin(t16), (L16/2)*cos(t16), -(L16/2)*sin(t16), 0, 0, 0, 0, 0, 0;
		-M17*L1*cos(t1), -M17*L2*cos(t2), -M17*L3*cos(t3), -M17*L4*cos(t4), -M17*L5*cos(t5), -M17*L6*cos(t6), -M17*L7*cos(t7), -M17*L8*cos(t8), -M17*L9*cos(t9), -M17*L10*cos(t10), -M17*L11*cos(t11), -M17*L12*cos(t12), -M17*L13*cos(t13), -M17*L14*cos(t14), -M17*L15*cos(t15), -M17*L16*cos(t16), -M17*(L17/2)*cos(t17), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0;
		M17*L1*sin(t1), M17*L2*sin(t2), M17*L3*sin(t3), M17*L4*sin(t4), M17*L5*sin(t5), M17*L6*sin(t6), M17*L7*sin(t7), M17*L8*sin(t8), M17*L9*sin(t9), M17*L10*sin(t10), M17*L11*sin(t11), M17*L12*sin(t12), M17*L13*sin(t13), M17*L14*sin(t14), M17*L15*sin(t15), M17*L16*sin(t16), M17*(L17/2)*sin(t17), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0;
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -M17*L17^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L17/2)*cos(t17), -(L17/2)*sin(t17), (L17/2)*cos(t17), -(L17/2)*sin(t17), 0, 0, 0, 0;
		-M18*L1*cos(t1), -M18*L2*cos(t2), -M18*L3*cos(t3), -M18*L4*cos(t4), -M18*L5*cos(t5), -M18*L6*cos(t6), -M18*L7*cos(t7), -M18*L8*cos(t8), -M18*L9*cos(t9), -M18*L10*cos(t10), -M18*L11*cos(t11), -M18*L12*cos(t12), -M18*L13*cos(t13), -M18*L14*cos(t14), -M18*L15*cos(t15), -M18*L16*cos(t16), -M18*L17*cos(t17), -M18*(L18/2)*cos(t18), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0;
		M18*L1*sin(t1), M18*L2*sin(t2), M18*L3*sin(t3), M18*L4*sin(t4), M18*L5*sin(t5), M18*L6*sin(t6), M18*L7*sin(t7), M18*L8*sin(t8), M18*L9*sin(t9), M18*L10*sin(t10), M18*L11*sin(t11), M18*L12*sin(t12), M18*L13*sin(t13), M18*L14*sin(t14), M18*L15*sin(t15), M18*L16*sin(t16), M18*L17*sin(t17), M18*(L18/2)*sin(t18), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0;
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -M18*L18^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L18/2)*cos(t18), -(L18/2)*sin(t18), (L18/2)*cos(t18), -(L18/2)*sin(t18), 0, 0;
		-M19*L1*cos(t1), -M19*L2*cos(t2), -M19*L3*cos(t3), -M19*L4*cos(t4), -M19*L5*cos(t5), -M19*L6*cos(t6), -M19*L7*cos(t7), -M19*L8*cos(t8), -M19*L9*cos(t9), -M19*L10*cos(t10), -M19*L11*cos(t11), -M19*L12*cos(t12), -M19*L13*cos(t13), -M19*L14*cos(t14), -M19*L15*cos(t15), -M19*L16*cos(t16), -M19*L17*cos(t17), -M19*L18*cos(t18), -M19*(L19/2)*cos(t19), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0;
		M19*L1*sin(t1), M19*L2*sin(t2), M19*L3*sin(t3), M19*L4*sin(t4), M19*L5*sin(t5), M19*L6*sin(t6), M19*L7*sin(t7), M19*L8*sin(t8), M19*L9*sin(t9), M19*L10*sin(t10), M19*L11*sin(t11), M19*L12*sin(t12), M19*L13*sin(t13), M19*L14*sin(t14), M19*L15*sin(t15), M19*L16*sin(t16), M19*L17*sin(t17), M19*L18*sin(t18), M19*(L19/2)*sin(t19), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1;
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -M19*L19^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L19/2)*cos(t19), -(L19/2)*sin(t19), (L19/2)*cos(t19), -(L19/2)*sin(t19);
		-M20*L1*cos(t1), -M20*L2*cos(t2), -M20*L3*cos(t3), -M20*L4*cos(t4), -M20*L5*cos(t5), -M20*L6*cos(t6), -M20*L7*cos(t7), -M20*L8*cos(t8), -M20*L9*cos(t9), -M20*L10*cos(t10), -M20*L11*cos(t11), -M20*L12*cos(t12), -M20*L13*cos(t13), -M20*L14*cos(t14), -M20*L15*cos(t15), -M20*L16*cos(t16), -M20*L17*cos(t17), -M20*L18*cos(t18), -M20*L19*cos(t19), -M20*(L20/2)*cos(t20), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0;
		M20*L1*sin(t1), M20*L2*sin(t2), M20*L3*sin(t3), M20*L4*sin(t4), M20*L5*sin(t5), M20*L6*sin(t6), M20*L7*sin(t7), M20*L8*sin(t8), M20*L9*sin(t9), M20*L10*sin(t10), M20*L11*sin(t11), M20*L12*sin(t12), M20*L13*sin(t13), M20*L14*sin(t14), M20*L15*sin(t15), M20*L16*sin(t16), M20*L17*sin(t17), M20*L18*sin(t18), M20*L19*sin(t19), M20*(L20/2)*sin(t20), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1;
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -M20*L20^2/12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (L20/2)*cos(t20), -(L20/2)*sin(t20);
		];

	r = [
		-M1*(L1/2)*sin(t1)*t1d^2; 
		-M1*g-M1*(L1/2)*cos(t1)*t1d^2; 
		0;
		-M2*L1*sin(t1)*t1d^2-M2*(L2/2)*sin(t2)*t2d^2; 
		-M2*g-M2*L1*cos(t1)*t1d^2-M2*(L2/2)*cos(t2)*t2d^2; 
		0;
		-M3*L1*sin(t1)*t1d^2-M3*L2*sin(t2)*t2d^2-M3*(L3/2)*sin(t3)*t3d^2; 
		-M3*g-M3*L1*cos(t1)*t1d^2-M3*L2*cos(t2)*t2d^2-M3*(L3/2)*cos(t3)*t3d^2; 
		0;
		-M4*L1*sin(t1)*t1d^2-M4*L2*sin(t2)*t2d^2-M4*L3*sin(t3)*t3d^2-M4*(L4/2)*sin(t4)*t4d^2; 
		-M4*g-M4*L1*cos(t1)*t1d^2-M4*L2*cos(t2)*t2d^2-M4*L3*cos(t3)*t3d^2-M4*(L4/2)*cos(t4)*t4d^2; 
		0;
		-M5*L1*sin(t1)*t1d^2-M5*L2*sin(t2)*t2d^2-M5*L3*sin(t3)*t3d^2-M5*L4*sin(t4)*t4d^2-M5*(L5/2)*sin(t5)*t5d^2; 
		-M5*g-M5*L1*cos(t1)*t1d^2-M5*L2*cos(t2)*t2d^2-M5*L3*cos(t3)*t3d^2-M5*L4*cos(t4)*t4d^2-M5*(L5/2)*cos(t5)*t5d^2; 
		0;
		-M6*L1*sin(t1)*t1d^2-M6*L2*sin(t2)*t2d^2-M6*L3*sin(t3)*t3d^2-M6*L4*sin(t4)*t4d^2-M6*L5*sin(t5)*t5d^2-M6*(L6/2)*sin(t6)*t6d^2; 
		-M6*g-M6*L1*cos(t1)*t1d^2-M6*L2*cos(t2)*t2d^2-M6*L3*cos(t3)*t3d^2-M6*L4*cos(t4)*t4d^2-M6*L5*cos(t5)*t5d^2-M6*(L6/2)*cos(t6)*t6d^2; 
		0;
		-M7*L1*sin(t1)*t1d^2-M7*L2*sin(t2)*t2d^2-M7*L3*sin(t3)*t3d^2-M7*L4*sin(t4)*t4d^2-M7*L5*sin(t5)*t5d^2-M7*L6*sin(t6)*t6d^2-M7*(L7/2)*sin(t7)*t7d^2; 
		-M7*g-M7*L1*cos(t1)*t1d^2-M7*L2*cos(t2)*t2d^2-M7*L3*cos(t3)*t3d^2-M7*L4*cos(t4)*t4d^2-M7*L5*cos(t5)*t5d^2-M7*L6*cos(t6)*t6d^2-M7*(L7/2)*cos(t7)*t7d^2; 
		0;
		-M8*L1*sin(t1)*t1d^2-M8*L2*sin(t2)*t2d^2-M8*L3*sin(t3)*t3d^2-M8*L4*sin(t4)*t4d^2-M8*L5*sin(t5)*t5d^2-M8*L6*sin(t6)*t6d^2-M8*L7*sin(t7)*t7d^2-M8*(L8/2)*sin(t8)*t8d^2; 
		-M8*g-M8*L1*cos(t1)*t1d^2-M8*L2*cos(t2)*t2d^2-M8*L3*cos(t3)*t3d^2-M8*L4*cos(t4)*t4d^2-M8*L5*cos(t5)*t5d^2-M8*L6*cos(t6)*t6d^2-M8*L7*cos(t7)*t7d^2-M8*(L8/2)*cos(t8)*t8d^2; 
		0;
		-M9*L1*sin(t1)*t1d^2-M9*L2*sin(t2)*t2d^2-M9*L3*sin(t3)*t3d^2-M9*L4*sin(t4)*t4d^2-M9*L5*sin(t5)*t5d^2-M9*L6*sin(t6)*t6d^2-M9*L7*sin(t7)*t7d^2-M9*L8*sin(t8)*t8d^2-M9*(L9/2)*sin(t9)*t9d^2; 
		-M9*g-M9*L1*cos(t1)*t1d^2-M9*L2*cos(t2)*t2d^2-M9*L3*cos(t3)*t3d^2-M9*L4*cos(t4)*t4d^2-M9*L5*cos(t5)*t5d^2-M9*L6*cos(t6)*t6d^2-M9*L7*cos(t7)*t7d^2-M9*L8*cos(t8)*t8d^2-M9*(L9/2)*cos(t9)*t9d^2; 
		0;
		-M10*L1*sin(t1)*t1d^2-M10*L2*sin(t2)*t2d^2-M10*L3*sin(t3)*t3d^2-M10*L4*sin(t4)*t4d^2-M10*L5*sin(t5)*t5d^2-M10*L6*sin(t6)*t6d^2-M10*L7*sin(t7)*t7d^2-M10*L8*sin(t8)*t8d^2-M10*L9*sin(t9)*t9d^2-M10*(L10/2)*sin(t10)*t10d^2; 
		-M10*g-M10*L1*cos(t1)*t1d^2-M10*L2*cos(t2)*t2d^2-M10*L3*cos(t3)*t3d^2-M10*L4*cos(t4)*t4d^2-M10*L5*cos(t5)*t5d^2-M10*L6*cos(t6)*t6d^2-M10*L7*cos(t7)*t7d^2-M10*L8*cos(t8)*t8d^2-M10*L9*cos(t9)*t9d^2-M10*(L10/2)*cos(t10)*t10d^2; 
		0;
		-M11*L1*sin(t1)*t1d^2-M11*L2*sin(t2)*t2d^2-M11*L3*sin(t3)*t3d^2-M11*L4*sin(t4)*t4d^2-M11*L5*sin(t5)*t5d^2-M11*L6*sin(t6)*t6d^2-M11*L7*sin(t7)*t7d^2-M11*L8*sin(t8)*t8d^2-M11*L9*sin(t9)*t9d^2-M11*L10*sin(t10)*t10d^2-M11*(L11/2)*sin(t11)*t11d^2; 
		-M11*g-M11*L1*cos(t1)*t1d^2-M11*L2*cos(t2)*t2d^2-M11*L3*cos(t3)*t3d^2-M11*L4*cos(t4)*t4d^2-M11*L5*cos(t5)*t5d^2-M11*L6*cos(t6)*t6d^2-M11*L7*cos(t7)*t7d^2-M11*L8*cos(t8)*t8d^2-M11*L9*cos(t9)*t9d^2-M11*L10*cos(t10)*t10d^2-M11*(L11/2)*cos(t11)*t11d^2; 
		0;
		-M12*L1*sin(t1)*t1d^2-M12*L2*sin(t2)*t2d^2-M12*L3*sin(t3)*t3d^2-M12*L4*sin(t4)*t4d^2-M12*L5*sin(t5)*t5d^2-M12*L6*sin(t6)*t6d^2-M12*L7*sin(t7)*t7d^2-M12*L8*sin(t8)*t8d^2-M12*L9*sin(t9)*t9d^2-M12*L10*sin(t10)*t10d^2-M12*L11*sin(t11)*t11d^2-M12*(L12/2)*sin(t12)*t12d^2; 
		-M12*g-M12*L1*cos(t1)*t1d^2-M12*L2*cos(t2)*t2d^2-M12*L3*cos(t3)*t3d^2-M12*L4*cos(t4)*t4d^2-M12*L5*cos(t5)*t5d^2-M12*L6*cos(t6)*t6d^2-M12*L7*cos(t7)*t7d^2-M12*L8*cos(t8)*t8d^2-M12*L9*cos(t9)*t9d^2-M12*L10*cos(t10)*t10d^2-M12*L11*cos(t11)*t11d^2-M12*(L12/2)*cos(t12)*t12d^2; 
		0;
		-M13*L1*sin(t1)*t1d^2-M13*L2*sin(t2)*t2d^2-M13*L3*sin(t3)*t3d^2-M13*L4*sin(t4)*t4d^2-M13*L5*sin(t5)*t5d^2-M13*L6*sin(t6)*t6d^2-M13*L7*sin(t7)*t7d^2-M13*L8*sin(t8)*t8d^2-M13*L9*sin(t9)*t9d^2-M13*L10*sin(t10)*t10d^2-M13*L11*sin(t11)*t11d^2-M13*L12*sin(t12)*t12d^2-M13*(L13/2)*sin(t13)*t13d^2; 
		-M13*g-M13*L1*cos(t1)*t1d^2-M13*L2*cos(t2)*t2d^2-M13*L3*cos(t3)*t3d^2-M13*L4*cos(t4)*t4d^2-M13*L5*cos(t5)*t5d^2-M13*L6*cos(t6)*t6d^2-M13*L7*cos(t7)*t7d^2-M13*L8*cos(t8)*t8d^2-M13*L9*cos(t9)*t9d^2-M13*L10*cos(t10)*t10d^2-M13*L11*cos(t11)*t11d^2-M13*L12*cos(t12)*t12d^2-M13*(L13/2)*cos(t13)*t13d^2; 
		0;
		-M14*L1*sin(t1)*t1d^2-M14*L2*sin(t2)*t2d^2-M14*L3*sin(t3)*t3d^2-M14*L4*sin(t4)*t4d^2-M14*L5*sin(t5)*t5d^2-M14*L6*sin(t6)*t6d^2-M14*L7*sin(t7)*t7d^2-M14*L8*sin(t8)*t8d^2-M14*L9*sin(t9)*t9d^2-M14*L10*sin(t10)*t10d^2-M14*L11*sin(t11)*t11d^2-M14*L12*sin(t12)*t12d^2-M14*L13*sin(t13)*t13d^2-M14*(L14/2)*sin(t14)*t14d^2; 
		-M14*g-M14*L1*cos(t1)*t1d^2-M14*L2*cos(t2)*t2d^2-M14*L3*cos(t3)*t3d^2-M14*L4*cos(t4)*t4d^2-M14*L5*cos(t5)*t5d^2-M14*L6*cos(t6)*t6d^2-M14*L7*cos(t7)*t7d^2-M14*L8*cos(t8)*t8d^2-M14*L9*cos(t9)*t9d^2-M14*L10*cos(t10)*t10d^2-M14*L11*cos(t11)*t11d^2-M14*L12*cos(t12)*t12d^2-M14*L13*cos(t13)*t13d^2-M14*(L14/2)*cos(t14)*t14d^2; 
		0;
		-M15*L1*sin(t1)*t1d^2-M15*L2*sin(t2)*t2d^2-M15*L3*sin(t3)*t3d^2-M15*L4*sin(t4)*t4d^2-M15*L5*sin(t5)*t5d^2-M15*L6*sin(t6)*t6d^2-M15*L7*sin(t7)*t7d^2-M15*L8*sin(t8)*t8d^2-M15*L9*sin(t9)*t9d^2-M15*L10*sin(t10)*t10d^2-M15*L11*sin(t11)*t11d^2-M15*L12*sin(t12)*t12d^2-M15*L13*sin(t13)*t13d^2-M15*L14*sin(t14)*t14d^2-M15*(L15/2)*sin(t15)*t15d^2; 
		-M15*g-M15*L1*cos(t1)*t1d^2-M15*L2*cos(t2)*t2d^2-M15*L3*cos(t3)*t3d^2-M15*L4*cos(t4)*t4d^2-M15*L5*cos(t5)*t5d^2-M15*L6*cos(t6)*t6d^2-M15*L7*cos(t7)*t7d^2-M15*L8*cos(t8)*t8d^2-M15*L9*cos(t9)*t9d^2-M15*L10*cos(t10)*t10d^2-M15*L11*cos(t11)*t11d^2-M15*L12*cos(t12)*t12d^2-M15*L13*cos(t13)*t13d^2-M15*L14*cos(t14)*t14d^2-M15*(L15/2)*cos(t15)*t15d^2; 
		0;
		-M16*L1*sin(t1)*t1d^2-M16*L2*sin(t2)*t2d^2-M16*L3*sin(t3)*t3d^2-M16*L4*sin(t4)*t4d^2-M16*L5*sin(t5)*t5d^2-M16*L6*sin(t6)*t6d^2-M16*L7*sin(t7)*t7d^2-M16*L8*sin(t8)*t8d^2-M16*L9*sin(t9)*t9d^2-M16*L10*sin(t10)*t10d^2-M16*L11*sin(t11)*t11d^2-M16*L12*sin(t12)*t12d^2-M16*L13*sin(t13)*t13d^2-M16*L14*sin(t14)*t14d^2-M16*L15*sin(t15)*t15d^2-M16*(L16/2)*sin(t16)*t16d^2; 
		-M16*g-M16*L1*cos(t1)*t1d^2-M16*L2*cos(t2)*t2d^2-M16*L3*cos(t3)*t3d^2-M16*L4*cos(t4)*t4d^2-M16*L5*cos(t5)*t5d^2-M16*L6*cos(t6)*t6d^2-M16*L7*cos(t7)*t7d^2-M16*L8*cos(t8)*t8d^2-M16*L9*cos(t9)*t9d^2-M16*L10*cos(t10)*t10d^2-M16*L11*cos(t11)*t11d^2-M16*L12*cos(t12)*t12d^2-M16*L13*cos(t13)*t13d^2-M16*L14*cos(t14)*t14d^2-M16*L15*cos(t15)*t15d^2-M16*(L16/2)*cos(t16)*t16d^2; 
		0;
		-M17*L1*sin(t1)*t1d^2-M17*L2*sin(t2)*t2d^2-M17*L3*sin(t3)*t3d^2-M17*L4*sin(t4)*t4d^2-M17*L5*sin(t5)*t5d^2-M17*L6*sin(t6)*t6d^2-M17*L7*sin(t7)*t7d^2-M17*L8*sin(t8)*t8d^2-M17*L9*sin(t9)*t9d^2-M17*L10*sin(t10)*t10d^2-M17*L11*sin(t11)*t11d^2-M17*L12*sin(t12)*t12d^2-M17*L13*sin(t13)*t13d^2-M17*L14*sin(t14)*t14d^2-M17*L15*sin(t15)*t15d^2-M17*L16*sin(t16)*t16d^2-M17*(L17/2)*sin(t17)*t17d^2; 
		-M17*g-M17*L1*cos(t1)*t1d^2-M17*L2*cos(t2)*t2d^2-M17*L3*cos(t3)*t3d^2-M17*L4*cos(t4)*t4d^2-M17*L5*cos(t5)*t5d^2-M17*L6*cos(t6)*t6d^2-M17*L7*cos(t7)*t7d^2-M17*L8*cos(t8)*t8d^2-M17*L9*cos(t9)*t9d^2-M17*L10*cos(t10)*t10d^2-M17*L11*cos(t11)*t11d^2-M17*L12*cos(t12)*t12d^2-M17*L13*cos(t13)*t13d^2-M17*L14*cos(t14)*t14d^2-M17*L15*cos(t15)*t15d^2-M17*L16*cos(t16)*t16d^2-M17*(L17/2)*cos(t17)*t17d^2; 
		0;
		-M18*L1*sin(t1)*t1d^2-M18*L2*sin(t2)*t2d^2-M18*L3*sin(t3)*t3d^2-M18*L4*sin(t4)*t4d^2-M18*L5*sin(t5)*t5d^2-M18*L6*sin(t6)*t6d^2-M18*L7*sin(t7)*t7d^2-M18*L8*sin(t8)*t8d^2-M18*L9*sin(t9)*t9d^2-M18*L10*sin(t10)*t10d^2-M18*L11*sin(t11)*t11d^2-M18*L12*sin(t12)*t12d^2-M18*L13*sin(t13)*t13d^2-M18*L14*sin(t14)*t14d^2-M18*L15*sin(t15)*t15d^2-M18*L16*sin(t16)*t16d^2-M18*L17*sin(t17)*t17d^2-M18*(L18/2)*sin(t18)*t18d^2; 
		-M18*g-M18*L1*cos(t1)*t1d^2-M18*L2*cos(t2)*t2d^2-M18*L3*cos(t3)*t3d^2-M18*L4*cos(t4)*t4d^2-M18*L5*cos(t5)*t5d^2-M18*L6*cos(t6)*t6d^2-M18*L7*cos(t7)*t7d^2-M18*L8*cos(t8)*t8d^2-M18*L9*cos(t9)*t9d^2-M18*L10*cos(t10)*t10d^2-M18*L11*cos(t11)*t11d^2-M18*L12*cos(t12)*t12d^2-M18*L13*cos(t13)*t13d^2-M18*L14*cos(t14)*t14d^2-M18*L15*cos(t15)*t15d^2-M18*L16*cos(t16)*t16d^2-M18*L17*cos(t17)*t17d^2-M18*(L18/2)*cos(t18)*t18d^2; 
		0;
		-M19*L1*sin(t1)*t1d^2-M19*L2*sin(t2)*t2d^2-M19*L3*sin(t3)*t3d^2-M19*L4*sin(t4)*t4d^2-M19*L5*sin(t5)*t5d^2-M19*L6*sin(t6)*t6d^2-M19*L7*sin(t7)*t7d^2-M19*L8*sin(t8)*t8d^2-M19*L9*sin(t9)*t9d^2-M19*L10*sin(t10)*t10d^2-M19*L11*sin(t11)*t11d^2-M19*L12*sin(t12)*t12d^2-M19*L13*sin(t13)*t13d^2-M19*L14*sin(t14)*t14d^2-M19*L15*sin(t15)*t15d^2-M19*L16*sin(t16)*t16d^2-M19*L17*sin(t17)*t17d^2-M19*L18*sin(t18)*t18d^2-M19*(L19/2)*sin(t19)*t19d^2; 
		-M19*g-M19*L1*cos(t1)*t1d^2-M19*L2*cos(t2)*t2d^2-M19*L3*cos(t3)*t3d^2-M19*L4*cos(t4)*t4d^2-M19*L5*cos(t5)*t5d^2-M19*L6*cos(t6)*t6d^2-M19*L7*cos(t7)*t7d^2-M19*L8*cos(t8)*t8d^2-M19*L9*cos(t9)*t9d^2-M19*L10*cos(t10)*t10d^2-M19*L11*cos(t11)*t11d^2-M19*L12*cos(t12)*t12d^2-M19*L13*cos(t13)*t13d^2-M19*L14*cos(t14)*t14d^2-M19*L15*cos(t15)*t15d^2-M19*L16*cos(t16)*t16d^2-M19*L17*cos(t17)*t17d^2-M19*L18*cos(t18)*t18d^2-M19*(L19/2)*cos(t19)*t19d^2; 
		0;
		-M20*L1*sin(t1)*t1d^2-M20*L2*sin(t2)*t2d^2-M20*L3*sin(t3)*t3d^2-M20*L4*sin(t4)*t4d^2-M20*L5*sin(t5)*t5d^2-M20*L6*sin(t6)*t6d^2-M20*L7*sin(t7)*t7d^2-M20*L8*sin(t8)*t8d^2-M20*L9*sin(t9)*t9d^2-M20*L10*sin(t10)*t10d^2-M20*L11*sin(t11)*t11d^2-M20*L12*sin(t12)*t12d^2-M20*L13*sin(t13)*t13d^2-M20*L14*sin(t14)*t14d^2-M20*L15*sin(t15)*t15d^2-M20*L16*sin(t16)*t16d^2-M20*L17*sin(t17)*t17d^2-M20*L18*sin(t18)*t18d^2-M20*L19*sin(t19)*t19d^2-M20*(L20/2)*sin(t20)*t20d^2; 
		-M20*g-M20*L1*cos(t1)*t1d^2-M20*L2*cos(t2)*t2d^2-M20*L3*cos(t3)*t3d^2-M20*L4*cos(t4)*t4d^2-M20*L5*cos(t5)*t5d^2-M20*L6*cos(t6)*t6d^2-M20*L7*cos(t7)*t7d^2-M20*L8*cos(t8)*t8d^2-M20*L9*cos(t9)*t9d^2-M20*L10*cos(t10)*t10d^2-M20*L11*cos(t11)*t11d^2-M20*L12*cos(t12)*t12d^2-M20*L13*cos(t13)*t13d^2-M20*L14*cos(t14)*t14d^2-M20*L15*cos(t15)*t15d^2-M20*L16*cos(t16)*t16d^2-M20*L17*cos(t17)*t17d^2-M20*L18*cos(t18)*t18d^2-M20*L19*cos(t19)*t19d^2-M20*(L20/2)*cos(t20)*t20d^2; 
		0
		];

		res = A\r;
end

function vals = motion(T, Z)
	t1d = Z(2);
	t2d = Z(4);
	t3d = Z(6);
	t4d = Z(8);
	t5d = Z(10);
	t6d = Z(12);
	t7d = Z(14);
	t8d = Z(16);
	t9d = Z(18);
	t10d = Z(20);
	t11d = Z(22);
	t12d = Z(24);
	t13d = Z(26);
	t14d = Z(28);
	t15d = Z(30);
	t16d = Z(32);
	t17d = Z(34);
	t18d = Z(36);
	t19d = Z(38);
	t20d = Z(40);

	res = calc_LHS(Z);

	t1dd = res(1);
	t2dd = res(2);
	t3dd = res(3);
	t4dd = res(4);
	t5dd = res(5);
	t6dd = res(6);
	t7dd = res(7);
	t8dd = res(8);
	t9dd = res(9);
	t10dd = res(10);
	t11dd = res(11);
	t12dd = res(12);
	t13dd = res(13);
	t14dd = res(14);
	t15dd = res(15);
	t16dd = res(16);
	t17dd = res(17);
	t18dd = res(18);
	t19dd = res(19);
	t20dd = res(20);

	vals = [ t1d; t1dd; t2d; t2dd; t3d; t3dd; t4d; t4dd; t5d; t5dd; t6d; t6dd; t7d; t7dd; t8d; t8dd; t9d; t9dd; t10d; t10dd; t11d; t11dd; t12d; t12dd; t13d; t13dd; t14d; t14dd; t15d; t15dd; t16d; t16dd; t17d; t17dd; t18d; t18dd; t19d; t19dd; t20d; t20dd];
end
end
