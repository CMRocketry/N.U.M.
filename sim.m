import pkg.*

tstep = .01; % seconds
time = 0; % second
ground = -.001; % meters
maxstep = 6000; 
air_density = 1.204;   % kg/m^3
rocket_cross_sec_area = .019; % m^2
rocket_drag_coeff = .45;      % unitless

drogue_cross_sec_area = 0.456;
drogue_drag_coeff = 1.55;

mainchute_cross_sec_area = 4.67;
mainchute_drag_coeff = 2.2;

rocket = ball(19.375, rocket_drag_coeff, 10, 0, 0, maxstep);

while (rocket.pos(rocket.step) > ground && time < 150)
    time = time + tstep;
    rocket.mass = mass_model(time);
    net_force = rocket.mass * rocket.g_accel;
    net_force = net_force + thrust_force(time);
    net_force = net_force + drag_force(rocket_drag_coeff, air_density, ...
        rocket.vel(rocket.step),rocket_cross_sec_area);
    if (rocket.vel(rocket.step) < 0)
        net_force = net_force + drag_force(drogue_drag_coeff, ...
            air_density, rocket.vel(rocket.step), drogue_cross_sec_area);
    end
    if (rocket.vel(rocket.step) < 0 && rocket.pos(rocket.step) < 167.64)
        net_force = net_force + drag_force(mainchute_drag_coeff, ...
            air_density, rocket.vel(rocket.step), mainchute_cross_sec_area);
    end
    rocket = rocket.time_step(tstep, net_force);
        
end
figure(1);
plot(rocket.time(1:rocket.step), rocket.pos(1:rocket.step)*3.28)
title("Altitude vs Time (zero wind) ")
xlabel("Time after Launch (s) ")
ylabel("Altitude (ft) ")
figure(2);
plot(rocket.time(1:rocket.step), rocket.vel(1:rocket.step)*3.28)
title("Velocity vs Time (zero wind) ")
xlabel("Time after Launch (s) ")
ylabel("Velocity (ft/s) ")
figure(3);
plot(rocket.time(1:rocket.step), rocket.accel(1:rocket.step)*3.28)
title("Acceleration vs Time (zero wind) ")
xlabel("Time after Launch (s) ")
ylabel("Acceleration (ft/s^2) ")
