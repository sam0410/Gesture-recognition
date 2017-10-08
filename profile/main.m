function [e,mid,x,y]= main(bin,file)


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

[mid] = hand_forearm_seg(bin);

[e,x,y] = erroe( mid,file ) ;
end

