function [x, y, z] = forward(q1, q2, q3)
    %theta1 = 0; 
    d1 = 9.4 + q1; 
    %alfa1 = pi; 
    a1 = 0;

    theta2 = deg2rad(q2); 
    d2 = 0; 
    %alfa2 = pi; 
    a2 = 11.2;

    theta3 = deg2rad(q3); 
    d3 = 0; 
    %alfa3 = pi; 
    a3 = 11.2;

    %theta4 = pi/2; 
    d4 = 9.4; 
    %alfa4 = 0; 
    a4 = 0;

    T01 = [ 1 0 0 a1;
            0 -1 0 0;
            0 0 -1 d1;
            0 0 0 1;
          ];
    
    T12 = [ cos(theta2) sin(theta2) 0 a2*cos(theta2);
            sin(theta2) -cos(theta2) 0 a2*sin(theta2);
            0 0 -1 d2;
            0 0 0 1;
          ];
    
    T23 = [ cos(theta3) sin(theta3) 0 a3*cos(theta3);
            sin(theta3) -cos(theta3) 0 a3*sin(theta3);
            0 0 -1 d3;
            0 0 0 1;
          ];
    
    T34 = [ 0 -1 0 0;
            1 0 0 a4;
            0 0 1 d4;
            0 0 0 1;];
     
     T = T01 * T12 * T23 * T34;
     
     x = T(1,4);
     y = T(2,4);
     z = T(3,4);
     
end