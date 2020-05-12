function [cm_crvene, cm_plave] = sorting (broj_pla, broj_crv, cm_crvene, cm_plave )
%UNTITLED2 Summary of this function goes here
 %  Detailed explanation goes here
x_sprem_crv=0;
y_sprem_crv=29.7/2;
x_sprem_pla=0;
y_sprem_pla=-29.7/2;

length_plav = zeros(3,broj_pla);
length_crv = zeros(3,broj_crv);
for i=1:broj_pla
    length_plav(1,i) = sqrt((x_sprem_crv-cm_plave(i).xos)^2+(y_sprem_crv-cm_plave(i).yos)^2);
    length_plav(2,i) = cm_plave(i).xos;
    length_plav(3,i) = cm_plave(i).yos;   
end;

for i=1:broj_crv
    length_crv(1,i) = sqrt((x_sprem_pla-cm_crvene(i).xos)^2+(y_sprem_pla-cm_crvene(i).yos)^2);
    length_crv(2,i) = cm_crvene(i).xos;
    length_crv(3,i) = cm_crvene(i).yos;
end;

length_plav=sortrows(length_plav',1)'
length_crv=sortrows(length_crv',1)'

for i=1:broj_pla
    cm_plave(i).xos=length_plav(2,i);
    cm_plave(i).yos=length_plav(3,i);  
end;

for i=1:broj_crv
    cm_crvene(i).xos=length_crv(2,i);
    cm_crvene(i).yos=length_crv(3,i);
end;



