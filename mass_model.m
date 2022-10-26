function mass = mass_model(time)
    simple_interp = [0, 19.41375;    % ignition time and wet mass
                    2.911, 17.735]; % burnout time and burnout mass
    if (time < simple_interp(1, 1))
        mass = 19.41375;        
    elseif (time > simple_interp(end, 1))
        mass = 17.735;
    else
        mass = interp1(simple_interp(:,1), simple_interp(:,end), time);
    end
end
