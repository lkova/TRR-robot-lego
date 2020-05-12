%function that calculates parameters of circles
function [parametri, br_predmeta]= detekcija (img_red_blue,img)

%[center,radius]=imfindcircles(img_red_blue,[20,30]);

%structuring element
krugovi=strel('disk',10);
%removing objects that are not disks
fixed=imopen(img_red_blue,krugovi); 

%create regions
[L,number_Objects]=bwlabel(fixed,8);
%find parameters
parametri=regionprops(L,'Centroid','Eccentricity', 'Area', 'BoundingBox');
areas=[parametri.Area];
eccentricities=[parametri.Eccentricity];


%number of objects on img
br_predmeta=find(eccentricities);
statsDefects=parametri(br_predmeta);

%figure,imshow(img);
%hold on;

%draw rectangle around circle---not important
for i=1:length(br_predmeta)
    h=rectangle('Position',statsDefects(i).BoundingBox);
    set(h,'EdgeColor',[.75,0,0]);
    hold on;
end
%draw number of object on its center
for j=1:length(br_predmeta)
    c=parametri(j).Centroid;
    text(c(1),c(2),sprintf('%d',j), 'HorizontalAlignment', 'center','VerticalAlignment', 'middle');
end

end

