classdef ball
    properties
        mass = 0;
        drag_coeff = 0;
        diameter = 0;
        g_accel = -9.81;
        forces = [];
        accel = [];
        vel = [];
        pos = [];
        time = [];
        step = 1;
    end
    methods
        function obj = ball(mass, drag_coeff, diameter, veli, posi, maxstep)
            obj.mass = mass;
            obj.drag_coeff = drag_coeff;
            obj.diameter = diameter;
            obj.g_accel = -9.81;
            obj.forces = zeros(1, maxstep);
            obj.accel = zeros(1, maxstep);
            obj.vel = zeros(1, maxstep);
            obj.vel(1) = veli;
            obj.pos = zeros(1, maxstep);
            obj.pos(1) = posi;
            obj.time = zeros(1, maxstep);
            obj.step = 1;
        end
        function accel = force2accel(obj, f)
            accel = f / obj.mass;
        end
        function obj = setforce(obj, f)
            obj.forces(obj.step) = f;
        end
        function obj = addforce(obj, f)
            obj.forces(obj.step) = obj.forces(obj.step) + f;
        end
        function obj = applyforce(obj)
            obj.accel(obj.step+1) = (obj.forces(obj.step) / obj.mass);
        end
        function obj = applyaccel(obj, tstep)
            obj.vel(obj.step+1) =  obj.vel(obj.step) + (obj.accel(obj.step) * tstep);
        end
        function obj = applyvel(obj, tstep)
            obj.pos(obj.step+1) =  obj.pos(obj.step) + (obj.vel(obj.step) * tstep);
        end
        function obj = time_step(obj, tstep, f)
            obj = obj.setforce(f);
            obj = obj.applyforce();
            obj = obj.applyaccel(tstep);
            obj = obj.applyvel(tstep);
            obj.time(obj.step+1) = obj.time(obj.step) + tstep;
            obj.step = obj.step + 1;
        end
    end
end