function [mid] = hand_forearm_seg(bin)
% Compute principal component orientation and rotate
bw=bwlabel(bin);
orientation = regionprops(bw, 'Orientation');
%centroid = regionprops(bw,'centroid');

% Correct rotation according to centroid
% Commented by me working good with their images
angle2 = (90-orientation.Orientation)*pi/(180);
rotated=rotateAround(bin, size(bin,2)/2, size(bin,1)/2,90-orientation.Orientation);

% rotationAngle = -90 - orientation.Orientation;
% if(centroid.Centroid(1) < size(img,2)/2)
%     rotationAngle = 90 - orientation.Orientation;
% end
% 
% rotated = imrotate(bw, rotationAngle);

%% calculate the horizontal and vertical profile
[ dist_h, dist_v ,dist_h_nnz, dist_v_nnz ] = profile( rotated );
% Smooth for cleaner peaks
%dist = smooth(dist, 15);

% Find peaks
[pks, locs] = findpeaks(-dist_v);  %% changed to dist_v
% [Rmaxtab, Rmintab] = peakdet(dist, 0.5);
% Select the peak carefully...
th = 50; % A threshold on the distance among peaks %%%
%% earlier 20
loc = locs(end);
for i = length(locs)-1 : -1 : 1
    if(abs(locs(i) - loc) > th)
        break;
    else
        loc = locs(i);
    end
end


% Keep best
ycut = loc;
[rows,cols]=size(rotated);
% mask 
mask=zeros(rows,cols);
mask(ycut,:)=1;
label=bwlabel(~mask);
final_mask=label==1;
crop=and(rotated , final_mask);
crop_fuse=imfuse(rotated , final_mask);
% imshow(crop_fuse)
ss=[];
for i= 1:size(rotated,1)
if(rotated(i,ycut)==1)
ss=[ss,i];
end
end
xmid= (ss(1)+ss(end))/2;

[Ibw] = forearm_segment_size( rotated );
imshowpair(Ibw,crop);

mx=[ ...
         cos(angle2) -sin(angle2)
         sin(angle2) cos(angle2)
         ];
     x1_y1=mx*[xmid - size(bin,1)/2;ycut - size(bin,2)/2];
     x1=x1_y1(1,:);
      y1=x1_y1(2,:);

mid = [size(bin,1)/2,size(bin,2)/2] + [x1(1),y1(1)];

end