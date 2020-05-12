function [ q2 , q3 ] = decision ( q2_tren , q3_tren , q2_inv , q3_inv ,greska)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    if (q2_inv(1)>60) && (q2_inv(1)<270)
        q2=q2_inv(2);
        q3=q3_inv(2);
        greska=1;
    end;
    if (q2_inv(2)>60) && (q2_inv(2)<270)
        q2=q2_inv(1);
        q3=q3_inv(1);
        greska=1;
    end;
    
    
    prvo=abs(q2_tren-q2_inv(1))+abs(q3_tren-q3_inv(1));
    drugo=abs(q2_tren-q2_inv(2))+abs(q3_tren-q3_inv(2));
    
    if (prvo<=drugo) && (greska==0)
        q2=q2_inv(1);
        q3=q3_inv(1);
    end;
    if (prvo>drugo) && (greska==0)   
        q2=q2_inv(2);
        q3=q3_inv(2);
    end; 
    
    
end

