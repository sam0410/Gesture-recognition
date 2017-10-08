function [Ibw,b2,a2,slope] = forearm_segment_size( Im )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%[height, width]=size(Im);
[m,n]=size(Im);
D = bwdist(~Im);
%figure, imshow(D,[]), title('Distance transform of ~bw')
max = 0;
a=0;
b=0;
for i=1:m
    for j=1:n
        if(D(i,j)>max)
            max = D(i,j);
            a=i;
            b=j;
        end
    end
end 
% disp (a);
% disp (b);
%f = D(a,b);
f=max;
G = zeros(m,n);
stats = regionprops(Im, 'Orientation');
theta = stats.Orientation;
%C = imfuse(Ibw,G);
X1 = b*cos(theta) ;
Y1 = size(Im,1)*sin(theta) ;
Z1 = 0 ;
X2 = b ;
Y2 = a ;
Z2 = 0 ;
v21 = [X1-X2,Y1-Y2,Z1-Z2];%%% just a refrence line perpendicular to x axis
x=1;
for th = 0:pi/100:2*pi
    xunit = f * cos(th) + a;
    yunit = f * sin(th) + b;
    x = x+1;
    X3 = ceil(yunit) ;
    Y3 = ceil(xunit) ;
    Z3 = 0 ;
    v23 = [X3-X2,Y3-Y2,Z3-Z2];
    angle = atan2(norm(cross(v21,v23)),dot(v21,v23));
    if(angle<=pi/2)% earlier ..... 5*pi/12
        G(abs(ceil(xunit)),abs(ceil(yunit))) = 1;  %%absolute value taken
    end
end
%N = imfuse(Ibw,G);
max2=0 ;
a2=0 ;
b2 = 0 ;
for i=1:m
    for j=1:n
        if(G(i,j)==1)
       if(D(i,j)>max2)
                max2 = D(i,j);
                a2=i;
                b2=j;                
          end
        end
    end
end
% disp(a2);
% disp(b2);
%imshow(N)
l = 1:n ;
k = ((b-b2)*l/(a2-a) +(a*a2+b*b2+f*f-a*a-b*b)/(a2-a)) ;
bwf=zeros(m,n);
for l=1:n
    tempy=uint16(((b-b2)*l/(a2-a) + (a*a2+b*b2+f*f-a*a-b*b)/(a2-a)));
    if(tempy<=m && tempy>0) % remove tempy=0 case
        bwf(tempy,l)=1;
    end
end

se=strel('disk',1);
bwf=imdilate(bwf,se);
Im =~Im;

% bwf=bwf+G;
bwf=Im + bwf;
%imtool(bwf);
se=strel('disk',2);
bwf=imdilate(bwf,se);
bwf=~bwf;
label=bwlabel(bwf);
%%checking where centre lies
for i = 1:2
    label_img = (label == i);
    if label_img(a,b) == 1
        required_label = i;
    end
end

    
Ibw=(label==required_label); %???
N=imfuse(Ibw,G);
global seq
imshow(N)
title(sprintf('Result of %d',seq))
hold on
line([ b b2], [ a a2])
slope = tan(((b2-b)./ (a2-a)));
pause(0.01)
end