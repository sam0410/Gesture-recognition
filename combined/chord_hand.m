function [out2,out,im1,angle2,mid_pt,index] = chord_hand(bin,L,delta)
%generate skin pixels



% [blue_image,bin] = generate_skinmap(I) ;

%cleaning up the image
% se = strel('disk',6);
% bin=imerode(bin,se);
% bin=imfill(bin,'holes');
% se=strel('disk',1);
% bin=imdilate(bin,se);
% imshow(bin);


% boundary /contour matrix
%N should come out to be one
%apply smoothening techniques




[B,len,N,~] = bwboundaries(bin,'noholes');
[bwl] = bwlabel(bin);
area = regionprops(bwl,'Area');
max_area = -1;
for  i= 1:N
    if area(i).Area > max_area
        max_area = area(i).Area;
        index = i;
    end
end

imshow(label2rgb(len, @jet, [.5 .5 .5]))
hold on
boundary = B{index};
plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2);

%generate contour matrix
n = length(boundary);
C = zeros(size(bin,1),size(bin,2));

for i = 1:n
    C(boundary(i,1),boundary(i,2)) = 1;
end



%initialize length of longest chord
d_max = 0;

%stop condition and chord counter
stop = false;
counter = 0;

%coordinates of non-zero members of contour matrix
[r,c,~] = find(C);
contour_no = length(r);
co_ordinates = [ r c ] ;


while stop == false 
    %random point on contour 
    
    p = round(contour_no*rand);
    q = round(contour_no*rand);
    
    if p == 0
        p = 1;
    end
    if q == 0
        q = 1;
    end
    
    P = co_ordinates(p,:);
    Q = co_ordinates(q,:);
%     P=boundary((randi([1,n],1,1)),:);
%     Q=boundary((randi([1,n],1,1)),:);
    
    %distance between random points
    distance_pq = dist(P,Q);
    
    %generate pixel values on the line segment PQ
    
        
            
    %check the longest chord condition
    if (distance_pq > d_max) && collision_check(P,Q,bin)
        d_max = distance_pq;
%         counter = 0;
        p_max = p;
        q_max = q;
        P_max = P;
        Q_max =Q;
    else
        counter = counter+1;
    end
%     counter = counter + 1;
    
    %maximumal number of draws in a single iteration
    if counter == L
        [ k,P_max,Q_max,d_max] = local_search(p_max,q_max,P_max,Q_max,C,delta,bin);
        if  k == 1
            counter = 0;
        else
            %stop condition is met
            stop = true;
        end
    end
    %P_maxQ_max is declared the longest chord
   
    
end

 out = [P_max;Q_max];
 
 
%plotting maximum chord
x=[out(1,1),out(2,1)];
y=[out(1,2),out(2,2)];
plot(y,x);
% plot(x,y);

%rotating image about the angle of the chord
angle2=  -(pi/2)-atan((y(2)-y(1))/(x(2)-x(1)));
angle = 180*angle2/(pi);
mid_pt = round([sum(x)/2,sum(y)/2]);

im1=rotateAround(bin,mid_pt(1),mid_pt(2),angle);
mx=[ ...
         cos(angle2) -sin(angle2)
         sin(angle2) cos(angle2)
         ];
     x1_y1=mx*[x - mid_pt(1);y - mid_pt(2)];
     x1=x1_y1(1,:);
      y1=x1_y1(2,:);

rotated_pointp = mid_pt + [x1(1),y1(1)];
rotated_pointq = mid_pt + [x1(2),y1(2)] ;
out2 = round([rotated_pointp;rotated_pointq]);


figure;
imshow(im1);
hold on;
plot(y1+mid_pt(2),x1+mid_pt(1),'b','linewidth',2)


            


end
