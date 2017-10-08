function [out2,im1,angle2,mid_pt,index] = chord_hand(bin)
%generate skin pixels
% [~,bin] = generate_skinmap(I);
[m,n,~] = size(bin);

% %cleaning up the image
% se = strel('disk',4);
% bin=imerode(bin,se);
% bin=imfill(bin,'holes');
% se=strel('disk',1);
% bin=imdilate(bin,se);
% imshow(bin);

[bwl,N] = bwlabel(bin);
area = regionprops(bwl,'Area');
max_area = -1;
for  i= 1:N
    if area(i).Area > max_area
        max_area = area(i).Area;
        index = i;
    end
end
bin=bwareaopen(bin,max_area);
bin=imfill(bin,'holes');


E = get_ellipse(bin);
angle2 = E.theta;



% [blue_image,bin] = generate_skinmap(I) ;
%plotting maximum chord


% plot(x,y);

%rotating image about the angle of the chord

angle = 180*angle2/(pi);
if angle > 90 || angle < -90
    angle =  angle - 180;
elseif angle < -90
    angle = 180 + angle;
end

angle2 = pi*angle/(180);
mid_pt = [ceil(E.x),ceil(E.y)];

im1=rotateAround(bin,ceil(E.y),ceil(E.x),angle);
X =[];
for i=2:n
    if im1(ceil(E.y),i) ~= im1(ceil(E.y),i-1)
        X = [X;i];
    end
end


if size(X) == 1
    X = [0;X];
end
        
    
X1 = X(1);
Y1 = ceil(E.y) ;

X2 = X(2) ;
Y2 = ceil(E.y) ;


out2 = [Y1,X1;Y2,X2];


figure;
imshow(im1);
hold on;
line([X1,X2],[Y1,Y2]);


            


end
