function [mid] = forearm_segment_size_main(bin )
%generate skin pixels

% I=1-I;
%  bin = skin2(I);
%  [c,v ] = size(bin);
%  bin(1:2,:) = 0;
%  bin(c-1:c,:) = 0;
%  bin(:,1:2) = 0;
%  bin(:,v-1:v) = 0;
 

%cleaning up the image
% imshow(bin);
% boundary /contour matrix
%N should come out to be one+
% 
%apply smoothening techniques

bin=bwmorph(bin,'erode',5);
bin=bwmorph(bin,'dilate',3);
bin=imfill(bin,'holes');
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
bin=bwareaopen(bin,max_area);
B=bwboundaries(bin);
B=B{1,1};
ss=size(B,1);

[mid] = forearm_segment_size(bin);

end

