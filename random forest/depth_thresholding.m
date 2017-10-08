function [ binary_image ] = depth_thresholding( depth )
a = 500; b = 1500;
depth(depth > b) = NaN;
depth(depth < a) = NaN;
depth = im2uint8(mat2gray(depth));
depth = imcomplement(depth);
%imshow(depth);
[r,c]=size(depth);
D=zeros(r,c);
th=210;
%     tic
for i=1:r
    for j=1:c
        if depth(i,j)> th
            D(i,j)=1;
        end
    end
end
%     toc
%imshow D
[L,num] = bwlabel(D);
for i=1:num
    area(i) = bwarea(L==i);
end
[C,I] = max(area);
Im=zeros([size(D,1) size(D,2)]);
ele=find(L==I);
Im(ele)=1;
binary_image=imfill(Im);

end

