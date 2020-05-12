%clear workspace
clear; 
%take a photo and save
%vid = videoinput('winvideo', 2);
%set(vid, 'ReturnedColorSpace', 'RGB');
%img = getsnapshot(vid);
cam=webcam(2);
cam.Exposure = -9;
pause(1);
slika=snapshot(cam);
imwrite(slika,'slikica.png');
img=imread('slikica.png');
load('parametriKamere2.mat');
img=undistortImage(img,cameraParams2);

%figure()
%imshow(img)
%% filter and hsv
gauss_filt = fspecial('gaussian', [10,10], 0.1);
img = imfilter(img, gauss_filt);
figure();imshow(img)

img_hsv=rgb2hsv(img);
%% find workspace corners

img_zuto1 = (img_hsv(:,:,1) > 0.09 & img_hsv(:,:,1) < 0.25 & img_hsv(:,:,2) > 0.38)  ;
%figure(); imshow(img_zuto1)
img_zuto2=bwareaopen(img_zuto1,200);
img_zuto=imfill(img_zuto2,8,'holes');

%[center,radius]=imfindcircles(img_zuto,[20,70]);
%viscircles(center,radius);
%figure();imshow(www);
%% 


%figure(); imshow(img_zuto);
%create structure element
krajnjeTocke=strel('disk',5);
nadi=imopen(img_zuto,krajnjeTocke);
%figure()imshow(nadi)

%create regions
[KT,kut_broj]=bwlabel(nadi,8);
%find parameters
parametri=regionprops(KT,'Centroid');
%% corners in order
for i=1:length(parametri)
    if (parametri(i).Centroid(1)<80 & parametri(i).Centroid(2)<80)
        dva=parametri(i).Centroid
    end
    if (parametri(i).Centroid(1)<80 & parametri(i).Centroid(2)>350)
            jedan=parametri(i).Centroid
    end
    if (parametri(i).Centroid(1)>500 & parametri(i).Centroid(2)<80)
        tri=parametri(i).Centroid
    end
    if (parametri(i).Centroid(1)>500 & parametri(i).Centroid(2)>350)
        cetiri=parametri(i).Centroid
    end
end
%% calculate cm/pix and center

%broj pix po x/y u cm
pix_cm_x=21/(((jedan(2)-dva(2))+(cetiri(2)-tri(2)))/2);
pix_cm_y=29.7/(((cetiri(1)-jedan(1))+(tri(1)-dva(1)))/2);
%pix_cm_x=(((jedan(2)-dva(2))+(cetiri(2)-tri(2)))/2)/21000;  staro krivo
%pix_cm_y=(((cetiri(1)-jedan(1))+(tri(1)-dva(1)))/2)/29700;

%srediste koordinatnog sustava
y0_pix=((cetiri(1)-jedan(1))/2+(tri(1)-dva(1))/2)/2+(jedan(1)+dva(1))/2;
x0_pix=(cetiri(2)+jedan(2))/2;
            
%% red circles segmenting color
min_saturation = 0.5;

img_red_coins1 = (img_hsv(:,:,1) >0.9 & img_hsv(:,:,1) < 1.0 & img_hsv(:,:,2) > min_saturation) | (img_hsv(:,:,1) > 0.0 & img_hsv(:,:,1) < 0.07 & img_hsv(:,:,2) > min_saturation) ;
img_red_coins2=bwareaopen(img_red_coins1,100);
img_red_coins=imfill(img_red_coins2,'holes');
%figure();imshow(img_red_coins)
%% blue circles segmenting color
blue_lower_hsv_bound = 0.45;
blue_upper_hsv_bound = 0.7;
min_saturation_blue=0.5;


img_blue_coins1 = (img_hsv(:,:,1) > blue_lower_hsv_bound) & (img_hsv(:,:,1) < blue_upper_hsv_bound) & (img_hsv(:,:,2) > min_saturation_blue) ;
img_blue_coins2=bwareaopen(img_blue_coins1,100);
img_blue_coins=imfill(img_blue_coins2,'holes');
%figure();imshow(img_blue_coins);

%% call detekcija which returns parameters and number of detected objects
[parametri_red,broj_crv]=detekcija(img_red_coins,img)
[parametri_blue,broj_pla]=detekcija(img_blue_coins,img)

for j=1:length(broj_crv)
    cm_crvene.xos(j)=-1*(parametri_red(j).Centroid(2)-x0_pix)*pix_cm_x;
    cm_crvene.yos(j)=-(parametri_red(j).Centroid(1)-y0_pix)*pix_cm_y;
end

for j=1:length(broj_pla)
    cm_plave(j).xos=-1*(parametri_blue(j).Centroid(2)-x0_pix)*pix_cm_x;
    cm_plave(j).yos=-(parametri_blue(j).Centroid(1)-y0_pix)*pix_cm_y;
end


