#trololol let's try generating matlab scripts

p_length = [1, 1, 1, 1];
p_mass = [10, 10, 10, 10];
t_init = ["pi/2", "pi/2", "pi/2", "pi/2"];
tv_init = [0, 0, 0, 0];
n_len = len(p_length)
r_zeros = [0]*(n_len*2)

init_string = "initial_vals = ["
with open("n_pen.m", 'w') as f:
	f.write("function n_pendulum\n")
	f.write("close all\n")

	#SETUP FUNCTIONS
	for i in range(n_len):
		f.write("L"+str(i+1)+"="+str(p_length[i])+";"+"\n")
	for i in range(n_len):
		f.write("M"+str(i+1)+"="+str(p_mass[i])+";"+"\n")
	f.write("g=9.81;\n")
	for i in range(n_len):
		init_string += str(t_init[i])+"; "
		if i == len(t_init)-1:
			init_string += str(tv_init[i])+"];"
		else:
			init_string += str(tv_init[i])+"; "
	f.write("t_interval = [0 10];\n")
	f.write(init_string+"\n")


	#CALLING ODE
	f.write("\n")
	f.write("options = odeset('RelTol', 1e-7);\n")
	f.write("[T_out, Z_out] = ode45(@motion, t_interval, initial_vals, options);\n")
	f.write("\n")

	#GET THETA VALUES
	for i in range(n_len):
		i += 1
		f.write("t"+str(i)+"_o = Z_out(:,"+str(2*i-1)+");\n")
		f.write("t"+str(i)+"d_o = Z_out(:,"+str(2*i)+");\n")
	f.write("\n")

	f.write("LHS = zeros(length(T_out), "+str(n_len*3)+");\n")
	f.write("for i = 1:length(T_out)\n")
	f.write("\tLHS(i, :) = calc_LHS(Z_out(i, :));\n")
	f.write("end\n")
	
	f.write("\n")
	for i in range(n_len):
		i += 1
		f.write("t"+str(i)+"dd_o = LHS(:,"+str(i+1)+");\n")
	f.write("\n")


	#GRAPHING THETA FUNCS
	f.write("figure\n")
	legend = "legend("
	for i in range(n_len):
		i += 1
		if i == n_len:
			legend += "\'Mass"+str(i)+"\')"
		else:
			legend += "\'Mass"+str(i)+"\', "

	f.write("subplot(3,1,1)\n")
	f.write("hold all\n")
	for i in range(n_len):
		i += 1
		f.write("plot(T_out, t"+str(i)+"_o)\n")
	f.write("title(\'Position\')\n")
	f.write("ylabel(\'Displacement (rad)\')\n")
	f.write(legend+"\n")
	f.write("\n")

	f.write("subplot(3,1,2)\n")
	f.write("hold all\n")
	for i in range(n_len):
		i += 1
		f.write("plot(T_out, t"+str(i)+"d_o)\n")
	f.write("title(\'Velocity\')\n")
	f.write("ylabel(\'Velocity (rad/s)\')\n")
	f.write(legend+"\n")
	f.write("\n")

	f.write("subplot(3,1,3)\n")
	f.write("hold all\n")
	for i in range(n_len):
		i += 1
		f.write("plot(T_out, t"+str(i)+"dd_o)\n")
	f.write("title(\'Acceleration\')\n")
	f.write("xlabel(\'Time (s)\')\n")
	f.write("ylabel(\'Acceleration (rad/s^2)\')\n")
	f.write(legend+"\n")
	f.write("\n")

	#CALC CARTESIAN POSITIONS
	for i in range(n_len):
		i += 1
		x_t = "x"+str(i)+" = "
		y_t = "y"+str(i)+" = "

		xv_t = "xv"+str(i)+" = "
		yv_t = "yv"+str(i)+" = "

		for j in range(i):
			j += 1
			if j == i:
				x_t += "+(L"+str(j)+"/2).*sin(t"+str(j)+"_o)"
				y_t += "-(L"+str(j)+"/2).*cos(t"+str(j)+"_o)"

				xv_t += "+(L"+str(j)+"/2).*cos(t"+str(j)+"_o).*t"+str(j)+"d_o"
				yv_t += "+(L"+str(j)+"/2).*sin(t"+str(j)+"_o).*t"+str(j)+"d_o"

			else:
				x_t += "+L"+str(j)+".*sin(t"+str(j)+"_o)"
				y_t += "-L"+str(j)+".*cos(t"+str(j)+"_o)"

				xv_t += "+L"+str(j)+".*cos(t"+str(j)+"_o).*t"+str(j)+"d_o"
				yv_t += "+L"+str(j)+".*sin(t"+str(j)+"_o).*t"+str(j)+"d_o"

		f.write(x_t+";\n")
		f.write(y_t+";\n")

		f.write(xv_t+";\n")
		f.write(yv_t+";\n")
		f.write("\n")

	f.write("\n")

	#ENERGY CALCULATIONS
	for i in range(n_len):
		i += 1
		f.write("PE"+str(i)+" = M"+str(i)+"*g.*y"+str(i)+";\n")
		f.write("KE"+str(i)+" = (M"+str(i)+"/2)*((xv"+str(i)+".^2 + yv"+str(i)+".^2)) + t"+str(i)+"d_o.^2*((L"+str(i)+"^2/12));\n")

	PE_t = "PE = "
	KE_t = "KE = "
	for i in range(n_len):
		i += 1
		PE_t += "+PE"+str(i)
		KE_t += "+KE"+str(i)

	f.write("\n")
	f.write(PE_t+";\n")
	f.write(KE_t+";\n")
	f.write("TE = PE + KE;\n")

	f.write("figure\n")
	f.write("hold all\n")
	f.write("plot(T_out, PE);\n")
	f.write("plot(T_out, KE);\n")
	f.write("plot(T_out, TE);\n")
	f.write("title(\'Total Energy\')\n")
	f.write("xlabel(\'Time (s)\')\n")
	f.write("ylabel(\'Energy (J)\')\n")
	f.write("legend(\'PE\', \'KE\', \'TE\')\n")
	f.write("\n")

	#ANIMATION FUNCTIONS
	for i in range(n_len):
		i += 1
		x_t = "x"+str(i)+" = "
		y_t = "y"+str(i)+" = "

		for j in range(i):
			j += 1

			x_t += "+L"+str(j)+".*sin(t"+str(j)+"_o)"
			y_t += "-L"+str(j)+".*cos(t"+str(j)+"_o)"

		f.write(x_t+";\n")
		f.write(y_t+";\n")

		f.write("\n")

	f.write("\n")
	f.write("figure\n")
	f.write("for i = 1:length(T_out)\n")
	f.write("\tclf;\n")
	f.write("\taxis([-5 5 -5 5]);\n")
	f.write("\thold all\n")

	for i in range(n_len):
		i += 1
		if i == 1:
			f.write("\tPX1 = [0; x1(i)];\n")
			f.write("\tPY1 = [0; y1(i)];\n")
		else:
			f.write("\tPX"+str(i)+" = [x"+str(i-1)+"(i); x"+str(i)+"(i)];\n")
			f.write("\tPY"+str(i)+" = [y"+str(i-1)+"(i); y"+str(i)+"(i)];\n")
		f.write("\n")
		f.write("\tplot(PX"+str(i)+", PY"+str(i)+", \'k\');\n")
	f.write("\tdrawnow;\n")
	f.write("\tpause(0.0005);\n")
	f.write("end\n")

	#CALC LHS
	f.write("function res = calc_LHS(Z)\n")
	for i in range(n_len):
		i += 1
		f.write("\tt"+str(i)+" = Z("+str(2*i-1)+");\n")
		f.write("\tt"+str(i)+"d = Z("+str(2*i)+");\n")

	#A MATRIX: ALL UNKNOWNS
	f.write("\n")
	f.write("\tA = [\n")

	for i in range(n_len):
		#MOMENT EQUATION
		Mi = "M"+str(i+1)
		Li = "L"+str(i+1)
		ti = "t"+str(i+1)

		moments = [0]*(n_len*3)
		moments[i] = "-"+Mi+"*"+Li+"^2/12"
		moments[n_len+2*i] = "("+Li+"/2)*cos("+ti+")"
		moments[n_len+2*i+1] = "-("+Li+"/2)*sin("+ti+")"

		try:
			moments[n_len+2*i+2] = "("+Li+"/2)*cos("+ti+")"
			moments[n_len+2*i+3] = "-("+Li+"/2)*sin("+ti+")"
		except:
			pass

		mom_str = ', '.join(str(x) for x in moments)
		mom_str += ";"

		#REACTION FORCE ELEMENTS
		dx_r = [0]*(n_len*2)
		dy_r = [0]*(n_len*2)

		dx_r[2*i] = -1
		dy_r[2*i+1] = -1
		try:
			dx_r[2*i+2] = 1
			dy_r[2*i+3] = 1
		except:
			pass

		dx_r_str = ', '.join(str(x) for x in dx_r)
		dx_r_str += ";"

		dy_r_str = ', '.join(str(x) for x in dy_r)
		dy_r_str += ";"

		#THETA_DD ELEMENTS
		dx_tdd = ""
		dy_tdd = ""
		i += 1
		for j in range(i):
			j += 1
			if j == i:
				dx_tdd += "-M"+str(i)+"*(L"+str(j)+"/2)*cos(t"+str(j)+"), "
				dy_tdd += "M"+str(i)+"*(L"+str(j)+"/2)*sin(t"+str(j)+"), "

			else:
				dx_tdd += "-M"+str(i)+"*L"+str(j)+"*cos(t"+str(j)+"), "
				dy_tdd += "M"+str(i)+"*L"+str(j)+"*sin(t"+str(j)+"), "

		k = i
		while k < n_len:
			dx_tdd += "0, "
			dy_tdd += "0, "
			k += 1

		f.write("\t\t"+dx_tdd+dx_r_str+"\n")
		f.write("\t\t"+dy_tdd+dy_r_str+"\n")
		f.write("\t\t"+mom_str+"\n")

	f.write("\t\t];\n")

	#R MATRIX: KNOWNS
	f.write("\n")
	f.write("\tr = [\n")

	for i in range(n_len):
		x_temp = ""
		y_temp = "-M"+str(i+1)+"*g"
		mom_temp = "0"

		i += 1
		for j in range(i):
			j += 1
			if j == i:
				x_temp += "-M"+str(i)+"*(L"+str(j)+"/2)*sin(t"+str(j)+")*t"+str(j)+"d^2; "
				y_temp += "-M"+str(i)+"*(L"+str(j)+"/2)*cos(t"+str(j)+")*t"+str(j)+"d^2; "
			else:
				x_temp += "-M"+str(i)+"*L"+str(j)+"*sin(t"+str(j)+")*t"+str(j)+"d^2"
				y_temp += "-M"+str(i)+"*L"+str(j)+"*cos(t"+str(j)+")*t"+str(j)+"d^2"

		f.write("\t\t"+x_temp+"\n")
		f.write("\t\t"+y_temp+"\n")
		if i == n_len:
			f.write("\t\t"+mom_temp+"\n")
		else:
			f.write("\t\t"+mom_temp+";\n")

	f.write("\t\t];\n")

	f.write("\n")
	f.write("\t\tres = A\\r;\n")
	f.write("end\n")


	#MOTION ODE
	f.write("\n")
	f.write("function vals = motion(T, Z)\n")
	for i in range(n_len):
		i += 1
		f.write("\tt"+str(i)+"d = Z("+str(2*i)+");\n")
	f.write("\n")
	f.write("\tres = calc_LHS(Z);\n")
	f.write("\n")
	for i in range(n_len):
		i += 1
		f.write("\tt"+str(i)+"dd = res("+str(i)+");\n")
	f.write("\n")

	v_string = "vals = ["

	for i in range(n_len):
		if i == n_len - 1:
			i += 1
			v_string += " t"+str(i)+"d; t"+str(i)+"dd];"
		else:
			i += 1
			v_string += " t"+str(i)+"d; t"+str(i)+"dd;"
	f.write("\t"+v_string+"\n")
	f.write("end\n")


	f.write("end\n")