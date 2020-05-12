function [q2_inv, q3_inv] = inverse(x, y)
    %a1 = 0;
    a2 = 11.2;
    a3 = 11.2;
    %a4 = 0;
    if x == 0 & y == 0
        q2_inv=[0 0];
        q3_inv=[180 180];
    else
        q3_inv(1) = acos((x^2 + y^2 - a2^2 - a3^2) / (2 * a2 * a3));
        q3_inv(2) = 2*pi-q3_inv(1);

        if y>0
           sin_q3(2) = -sqrt(1 - (cos(q3_inv(2)))^2);
           q2_inv(2) = rad2deg(2*pi-(acos((x * (a2 + a3 * cos(q3_inv(2))) + a3 * y * sin_q3(2)) / (x^2 + y^2))));
           q2_inv(1) = q2_inv(2)-360+rad2deg(2*acos((sqrt(x^2+y^2))/2/a2));
        end;

        if y<=0
           sin_q3(1) = sqrt(1 - (cos(q3_inv(1)))^2);
           q2_inv(1) = rad2deg(acos((x * (a2 + a3 * cos(q3_inv(1))) + a3 * y * sin_q3(1)) / (x^2 + y^2)));  
           q2_inv(2) = q2_inv(1)+360-rad2deg(2*acos((sqrt(x^2+y^2))/2/a2));
        end;

        q3_inv(1) = rad2deg(q3_inv(1));
        q3_inv(2) = rad2deg(q3_inv(2));

        if q2_inv(1)<0 
            q2_inv(1)=q2_inv(1)+360;
        end;
        if q2_inv(2)<0 
            q2_inv(2)=q2_inv(2)+360;
        end;  
        if q2_inv(1)>360 
            q2_inv(1)=q2_inv(1)-360;
        end;
        if q2_inv(2)>360
            q2_inv(2)=q2_inv(2)-360;
        end;  
    end;
    
end