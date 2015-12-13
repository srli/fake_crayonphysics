function n_pendulum
close all
L1=1;
L2=1;
L3=1;
L4=1;
M1=10;
M2=10;
M3=10;
M4=10;
g=9.81;
t_interval = [0 10];
initial_vals = [pi/2; 0; pi/2; 0; pi/2; 0; pi/2; 0];

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

figure
hold all
plot(T_out, t1_o)
plot(T_out, t2_o)
plot(T_out, t3_o)
plot(T_out, t4_o)
function res = calc_LHS(Z)
	t1 = Z(1);
	t1d = Z(2);
	t2 = Z(3);
	t2d = Z(4);
	t3 = Z(5);
	t3d = Z(6);
	t4 = Z(7);
	t4d = Z(8);

	A = [
		-M1*(L1/2)*cos(t1), 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0;
		M1*(L1/2)*sin(t1), 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0;
		-M1*L1^2/12, 0, 0, 0, (L1/2)*cos(t1), -(L1/2)*sin(t1), (L1/2)*cos(t1), -(L1/2)*sin(t1), 0, 0, 0, 0;
		-M2*L1*cos(t1), -M2*(L2/2)*cos(t2), 0, 0, 0, 0, -1, 0, 1, 0, 0, 0;
		M2*L1*sin(t1), M2*(L2/2)*sin(t2), 0, 0, 0, 0, 0, -1, 0, 1, 0, 0;
		0, -M2*L2^2/12, 0, 0, 0, 0, (L2/2)*cos(t2), -(L2/2)*sin(t2), (L2/2)*cos(t2), -(L2/2)*sin(t2), 0, 0;
		-M3*L1*cos(t1), -M3*L2*cos(t2), -M3*(L3/2)*cos(t3), 0, 0, 0, 0, 0, -1, 0, 1, 0;
		M3*L1*sin(t1), M3*L2*sin(t2), M3*(L3/2)*sin(t3), 0, 0, 0, 0, 0, 0, -1, 0, 1;
		0, 0, -M3*L3^2/12, 0, 0, 0, 0, 0, (L3/2)*cos(t3), -(L3/2)*sin(t3), (L3/2)*cos(t3), -(L3/2)*sin(t3);
		-M4*L1*cos(t1), -M4*L2*cos(t2), -M4*L3*cos(t3), -M4*(L4/2)*cos(t4), 0, 0, 0, 0, 0, 0, -1, 0;
		M4*L1*sin(t1), M4*L2*sin(t2), M4*L3*sin(t3), M4*(L4/2)*sin(t4), 0, 0, 0, 0, 0, 0, 0, -1;
		0, 0, 0, -M4*L4^2/12, 0, 0, 0, 0, 0, 0, (L4/2)*cos(t4), -(L4/2)*sin(t4);
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
		0
		];

		res = A\r;
end

function vals = motion(T, Z)
	t1d = Z(2);
	t2d = Z(4);
	t3d = Z(6);
	t4d = Z(8);

	res = calc_LHS(Z);

	t1dd = res(1);
	t2dd = res(2);
	t3dd = res(3);
	t4dd = res(4);

	vals = [ t1d; t1dd; t2d; t2dd; t3d; t3dd; t4d; t4dd];
end
end
