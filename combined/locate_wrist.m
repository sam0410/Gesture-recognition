function [ midpt,y ] = locate_wrist( im1,out2)

[bwl,N] = bwlabel(im1);
area = regionprops(bwl,'Area');
max_area = -1;

for  i= 1:N
    if area(i).Area > max_area
        max_area = area(i).Area;
        index = i;
    end
end

im1 = bwareaopen(im1,max_area);

%pixel values of the longest chord
[pixel,~]=bresenham(out2(1,1),out2(1,2),out2(2,1),out2(2,2));

%specify data
profile_width = length(pixel);
delta = round(profile_width/30);
n_i = round(profile_width/3.5);
epsilon = 2;
k = 1.5;

%finding the point on the longest chord that is away from palm
if out2(1,2)>out2(2,2)
    y = out2(2,2);
    end_pt = out2(1,2);
else
    y = out2(1,2);
    end_pt = out2(2,2);
end
if y<=0
    y = 1;
end


n= n_i;
%finding the local maxima

% mini_length = profile_width;
% while y+delta < profile_width/1.5
%     if chord_length(y+delta,im1) < mini_length
%         y1 = y+delta;
%         mini_length = chord_length(y+delta,im1);
%     end
%     y = y+delta;
% end


while chord_length(y+delta,im1) < chord_length(y,im1)
    y = y+delta;
end
%finding the minima
while (n)>epsilon
    y= y + n;
    if chord_length(y+n,im1) < chord_length(y,im1) 
        n = round(n/k);
    elseif chord_length(y,im1) == 0
        y = y+n;
        
    else
        n = round(-n/k);
    end
    
end

%locating the wrist on the image
[B,len,N,~] = bwboundaries(im1,'noholes');
[bwl] = bwlabel(im1);
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
x = find(boundary(:,2) == y);

plot([y;y],[0,size(im1,1)],  'w', 'LineWidth', 2);

max = abs(boundary(x(1)) - boundary(x(2)));
X = (boundary(x(1))+boundary(x(2)))/2;

if size(X) > 2
    for i = 2:size(x)-1
        if abs(boundary(x(i)) - boundary(x(i+1))) > max && im1((boundary(x(i))+boundary(x(i+1)))/2,y) == 1
           max = abs(boundary(x(i)) - boundary(x(i+1)));
           X = (boundary(x(i))+boundary(x(i+1)))/2;
        end
    end
end

    
midpt= [X ,y];
% midpt= [sum(boundary(x))/size(x) ,y];
pause(2);


end


