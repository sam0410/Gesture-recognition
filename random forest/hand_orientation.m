function [ features ] = hand_orientation( depth )






%selected foreground pixels in bin
[ bin] = depth_thresholding(depth);

%cleaning up the image
% se = strel('disk',4);
% bin=imerode(bin,se);
% bin=imfill(bin,'holes');
% se=strel('disk',1);
% bin=imdilate(bin,se);
% imshow(bin);

%parameters like centre of hand,hand length,orientation of hand
stats = regionprops(bin,'Centroid','MajorAxisLength', 'MinorAxisLength', 'Orientation');
h = stats.MajorAxisLength/2;
theta = stats.Orientation;
centroid = stats.Centroid;

%redefining the cartesian system

%selecting a random line
%change these parameters accordingly(old adapted to new)
alpha = (0.15*h );
beta = (0.65*h );
mx=[ ...
         cosd(theta) -sind(theta)
         sind(theta) cosd(theta)
         ];
     x1_y1=mx*[alpha;beta];
alpha = x1_y1(1)+centroid(2);
beta = x1_y1(2)+centroid(1);
gamma = 60+90+theta;
length = 1.5*h;

end_points_random_line = [ round(alpha + ((length/2)*cosd(gamma))) , round(beta +((length/2)*sind(gamma))), round(alpha - ((length/2)*cosd(gamma))) , round(beta - ((length/2)*sind(gamma)))];

[x y]=bresenham(end_points_random_line);

figure;
imshow(bin);
hold on;
plot(y,x,'b','linewidth',2)

[ features ] = feature_generator( bin,x,y,depth );
features = features';










end

