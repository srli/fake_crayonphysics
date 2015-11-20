
function res = double_pendulum()
    
    % set initial conditions
    g = 9.8; % acceleration due to gravity (m/s^2)
    L1 = 1; % length of pendulum 2 (m)
    L2 = 1; % length pf pendulum 2 (m)
    m1 = 1; % mass of first tire (kg)
    m2 = 2; % mass of second tire (kg)
    theta_01 = pi/3; % initial displacement angle (radians)
    omega_01 = 0; % initial angular velocity (radians/s)
    theta_02 = pi/3;
    omega_02 = 0;
    
     % establish start conditions into column vector
    start_conditions = [theta_01; omega_01; theta_02; omega_02];
    
    % run ode45!
    [T, M] = ode45(@find_theta, [0: 0.01: 15], start_conditions);
    theta1 = M(:,1);
    omega1_new = M(:,2);
    theta2 = M(:,3);
    omega2_new = M(:,4);
    theta_dd1 = (-g .* (2 .* m1 + m2) .* sin(theta1) - m2 .* g .* sin(theta1 - 2 .* theta2) - 2 .* sin(theta1 - theta2) .* m2 .* (omega2_new.^2 .* L2 + omega1_new.^2 .* L1 .* cos(theta1 - theta2))) ./ (L1 .* (2 .* m1 + m2 - m2 .* cos(2 .* theta1 - 2 .* theta2))); % angular acceleration (radians/s^2)
    theta_dd2 = (2 .* sin(theta1 - theta2) .* (omega1_new.^2 .* L1 .* (m1 + m2) + g .* (m1 + m2) .* cos(theta1) + omega2_new.^2 .* L2 .* m2 .* cos(theta1- theta2))) ./ (L2 .* (2 .* m1 + m2 - m2 .* cos(2 .* theta1 - 2 .* theta2)));
   
    x1 = L1 .* sin(theta1);
    y1 = L1 .* -cos(theta1);
    Vx1 = L1 .* omega1_new .* cos(theta1);
    Vy1 = L1 .* omega1_new .* sin(theta1);
    Ax1 = L1 .* theta_dd1 .* cos(theta1) - L1 .* (omega1_new .^2) .* sin(theta1);
    Ay1 = L1 * theta_dd1.* sin(theta1) + L1 * (omega1_new .^2) .* cos(theta1);
    x2 = x1 + L2 .* sin(theta2);
    y2 = y1 + L2 .* -cos(theta2);
    Vx2 = L1 .* omega1_new  .* cos(theta1) + L2 .* omega2_new .* cos(theta2);
    Vy2 = L1 .* omega1_new  .* sin(theta1) + L2 .* omega2_new .* sin(theta2);
    Ax2 = L2 .* theta_dd2 .* cos(theta2) - L2 .* (omega2_new .^2) .* sin(theta2);
    Ay2 = L2 .* theta_dd2 .* sin(theta2) + L2 .* (omega2_new .^2) .* cos(theta2);
   
    T2 = -m2*(L1*theta_dd1.*sin(theta2-theta1)-L1*omega1_new.^2.*cos(theta2-theta1)-L2*omega2_new.^2-g*cos(theta2));
    T1 = m1*g*cos(theta1)+ T2.*cos(theta2-theta1) + m1*L1*omega1_new.^2;
   
    figure
    hold on
    plot(T, theta1, 'r')
    plot(T, theta2, 'k')
    xlabel('Time')
    ylabel('Angle')
    legend('AD 1', 'AD 2')
    title('Angular Dispalcement')
   
    figure
    hold on
    plot(T,Vx1+Vy1,'r')
    plot(T,Vx2+Vy2,'b')
    xlabel('Time')
    ylabel('Acceleration')
    legend('Vel m1', 'Vel m2')
    title('Velocity')
   
    figure
    hold on
    plot(T,Ax1+Ay1,'r')
    plot(T,Ax2+Ay2,'b')
    xlabel('Time')
    ylabel('Acceleration')
    legend('Acl m1', 'Acl m2')
    title('Acceleration')

   figure  
   hold all
   KE1 = .5*m1*(Vx1.^2+Vy1.^2);
   KE2 = .5*m2*(Vx2.^2+Vy2.^2);
   KE = KE1 + KE2;
   PE1 = m1*g.*y1;
   PE2 = m2*g.*y2;
   PE = PE1 + PE2;
   E = KE + PE;
   plot(T, PE,'k')
   plot(T, KE,'b')
   plot(T, E,'y')
    xlabel('Time')
    ylabel('Energy')
   legend('PE', 'KE', 'E')
   title('Energy')
   
    figure
    hold all
    plot(T, T1, 'r')
    plot(T, T2, 'k')
    xlabel('Time')
    ylabel('Tension')
    legend('T1', 'T2')
    title('Tension')
     

    function res = find_theta(t, conditions)
        
        % unpack variable thetas
        theta1 = conditions(1);
        theta_dot1 = conditions(2);
        theta2 = conditions(3);
        theta_dot2 = conditions(4);
        
        theta_double_dot1 = (-g * (2 * m1 + m2) * sin(theta1) - m2 * g * sin(theta1 - 2 * theta2) - 2 * sin(theta1 - theta2) * m2 * (theta_dot2^2 * L2 + theta_dot1^2 * L1 * cos(theta1 - theta2))) / (L1 * (2 * m1 + m2 - m2 * cos(2 * theta1 - 2 * theta2)));
        
        theta_double_dot2 = (2 * sin(theta1 - theta2) * (theta_dot1^2 * L1 * (m1 + m2) + g * (m1 + m2) * cos(theta1) + theta_dot2^2 * L2 * m2 * cos(theta1 - theta2))) / (L2 * (2 * m1 + m2 - m2 * cos(2 * theta1 - 2 * theta2)));
        
        % repack thetas into column vector
        res = [theta_dot1; theta_double_dot1; theta_dot2; theta_double_dot2];
                
    end
 %% ANIMATION   

    for i = 1:length(T)
        % first pendulum
        position_x1(i) = L1 .* sin(theta1(i));
        position_y1(i) = -L1 .* cos(theta1(i));
        velocity_x1 = L1 .* omega1_new .* cos(theta1);
        velocity_y1 = L1 .* omega1_new .* sin(theta1(i));
        acceleration_x1 = L1 .* (-omega1_new.^2 .* sin(theta1) + theta_dd1 .* cos(theta1));
        acceleration_y1 = L1 .* (omega1_new.^2 .* cos(theta1) + theta_dd1 .* sin(theta1));
        
        % second pendulum
        position_x2(i) = L1 .* sin(theta1(i)) + L2 .* sin(theta2(i));
        position_y2(i) = -L1 .* cos(theta1(i)) - L2 .* cos(theta2(i));
        velocity_x2 = L1 .* omega1_new .* cos(theta1) + L2 .* omega2_new .* cos(theta2);
        velocity_y2 = L1 .* omega1_new .* sin(theta1) + L2 .* omega2_new .* cos(theta2);
        acceleration_x2 = L1 .* omega1_new .* -omega1_new .* sin(theta1) + L1 .* theta_dd1 .* cos(theta1) + L2 .* omega2_new .* -omega2_new .* sin(theta2) + L2 .* theta_dd2 .* cos(theta2);
        acceleration_y2 = L1 .* omega1_new .* -omega1_new .* cos(theta1) + L1 .* theta_dd1 .* sin(theta1) + L2 .* omega2_new .* -omega2_new .* cos(theta2) + L2 .* theta_dd2 .* sin(theta2);
        
        
    end

    for i = 1:length(T)
        clf; % clear the old figure
        axis([-3 3 -3 3]);
        hold all
        PX = [0; position_x1(i)];
        PY = [0; position_y1(i)];
        PX2 = [position_x1(i); position_x2(i)];
        PY2 = [position_y1(i); position_y2(i)];
        quiver(position_x1(i), position_y1(i), velocity_x1(i)/5, velocity_y1(i)/5, 'g');
        quiver(position_x1(i), position_y1(i), acceleration_x1(i)/10, acceleration_y1(i)/10, 'r');
        quiver(position_x2(i), position_y2(i), velocity_x2(i)/5, velocity_y2(i)/5, 'g');
        quiver(position_x2(i), position_y2(i), acceleration_x2(i)/20, acceleration_y2(i)/20, 'r');
        plot(PX, PY, 'k');
        plot(PX2, PY2, 'k');
        plot(position_x1(i), position_y1(i), 'm.', 'linewidth', 10, 'markersize', 20);
        plot(position_x2(i), position_y2(i), 'm.', 'linewidth', 10, 'markersize', 20);
        drawnow; % DO NOT FORGET THIS
        pause(0.001);
    end
    
    
end