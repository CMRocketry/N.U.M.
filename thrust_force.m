function force = thrust_force(time)
    x = [0, 0;
        0.018, 906.203;
        0.041, 1249.41;
        0.055, 1336.72;
        0.099, 1369.84;
        0.173, 1402.96;
        0.236, 1411.99;
        0.284, 1411.99;
        0.678, 1586.61;
        0.869, 1649.83;
        0.939, 1640.8;
        1.102, 1625.74;
        1.197, 1628.76;
        1.293, 1619.72;
        1.374, 1607.68;
        1.455, 1601.66;
        1.518, 1589.62;
        1.592, 1550.48;
        1.691, 1499.3;
        1.838, 1424.03;
        1.96, 1366.83;
        2.1, 1312.64;
        2.225, 1261.46;
        2.343, 1228.34;
        2.417, 1213.29;
        2.479, 1204.26;
        2.524, 1198.23;
        2.564, 1198.23;
        2.601, 1165.12;
        2.638, 1074.8;
        2.66, 957.383;
        2.689, 839.968;
        2.712, 713.522;
        2.737, 590.085;
        2.763, 427.511;
        2.8, 295.043;
        2.844, 153.543;
        2.877, 69.245;
        2.911, 0];
    if (time > x(end, 1) || time < x(1,1))
        force = 0;
    else
        force = interp1(x(:,1), x(:,2), time);
    end
end