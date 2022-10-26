function force = drag_force(drag_coeff, air_density, vel, area)
    % outputs directional force based on velocity
    force = -(drag_coeff*air_density*abs(vel)*vel*area/2);
end