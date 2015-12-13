function n_pendulum
close all
L1=1;
L2=1;

M1=10;
M2=10;

g=9.81;

t_interval = 0:0.025:10;
initial_vals = [pi/2; 0;  pi/2; 0];

options = odeset('RelTol', 1e-7);
[T_out, Z_out] = ode45(@motion, t_interval, initial_vals, options);

t1_o = Z_out(:,1);
t1d_o = Z_out(:,2);
t2_o = Z_out(:,3);
t2d_o = Z_out(:,4);

LHS = zeros(length(T_out), 6);
for i = 1:length(T_out)
	LHS(i, :) = calc_LHS(Z_out(i, :));
end

t1dd_o = LHS(:,2);
t2dd_o = LHS(:,3);

figure
subplot(3,1,1)
hold all
plot(T_out, t1_o)
plot(T_out, t2_o)
title('Position')
ylabel('Displacement (rad)')
legend('Mass1', 'Mass2')

subplot(3,1,2)
hold all
plot(T_out, t1d_o)
plot(T_out, t2d_o)
title('Velocity')
ylabel('Velocity (rad/s)')
legend('Mass1', 'Mass2')

subplot(3,1,3)
hold all
plot(T_out, t1dd_o)
plot(T_out, t2dd_o)
title('Acceleration')
xlabel('Time (s)')
ylabel('Acceleration (rad/s^2)')
legend('Mass1', 'Mass2')

x1 = +(L1/2).*sin(t1_o);
y1 = -(L1/2).*cos(t1_o);
xv1 = +(L1/2).*cos(t1_o).*t1d_o;
yv1 = +(L1/2).*sin(t1_o).*t1d_o;

x2 = +L1.*sin(t1_o)+(L2/2).*sin(t2_o);
y2 = -L1.*cos(t1_o)-(L2/2).*cos(t2_o);
xv2 = +L1.*cos(t1_o).*t1d_o+(L2/2).*cos(t2_o).*t2d_o;
yv2 = +L1.*sin(t1_o).*t1d_o+(L2/2).*sin(t2_o).*t2d_o;


PE1 = M1*g.*y1;
KE1 = (M1/2)*((xv1.^2 + yv1.^2)) + t1d_o.^2*((L1^2/12));
PE2 = M2*g.*y2;
KE2 = (M2/2)*((xv2.^2 + yv2.^2)) + t2d_o.^2*((L2^2/12));

PE = +PE1+PE2;
KE = +KE1+KE2;
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

v = VideoWriter('n2_pen.avi');
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

	A = [
		-M1*(L1/2)*cos(t1), 0, -1, 0, 1, 0;
		M1*(L1/2)*sin(t1), 0, 0, -1, 0, 1;
		-M1*L1^2/12, 0, (L1/2)*cos(t1), -(L1/2)*sin(t1), (L1/2)*cos(t1), -(L1/2)*sin(t1);
		-M2*L1*cos(t1), -M2*(L2/2)*cos(t2), 0, 0, -1, 0;
		M2*L1*sin(t1), M2*(L2/2)*sin(t2), 0, 0, 0, -1;
		0, -M2*L2^2/12, 0, 0, (L2/2)*cos(t2), -(L2/2)*sin(t2);
		];

	r = [
		-M1*(L1/2)*sin(t1)*t1d^2; 
		-M1*g-M1*(L1/2)*cos(t1)*t1d^2; 
		0;
		-M2*L1*sin(t1)*t1d^2-M2*(L2/2)*sin(t2)*t2d^2; 
		-M2*g-M2*L1*cos(t1)*t1d^2-M2*(L2/2)*cos(t2)*t2d^2; 
		0
		];

		res = A\r;
end

function vals = motion(T, Z)
	t1d = Z(2);
	t2d = Z(4);

	res = calc_LHS(Z);

	t1dd = res(1);
	t2dd = res(2);

	vals = [ t1d; t1dd; t2d; t2dd];
end
end
