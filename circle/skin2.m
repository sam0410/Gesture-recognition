function [p] = skin2(img)
% segmentasi

[m,n,~]=size(img);
p=zeros(m,n);
% k = imcrop(img);
% var = 0;
% r_max = max(max(k(:,:,1)))+var;
% r_min = min(min(k(:,:,1)))-var;
% g_max = max(max(k(:,:,2)))+var;
% g_min = min(min(k(:,:,2)))-var;
% b_max = max(max(k(:,:,3)))+var;
% b_min = min(min(k(:,:,3)))-var;

img_ycbcr = rgb2ycbcr(img);
    Cb = img_ycbcr(:,:,2);
    Cr = img_ycbcr(:,:,3);
    
  
b_max = 180;
b_min = 20;
g_max = 180;
g_min = 30;
r_max = 220;
r_min = 100;

for i=1:m
    for j= 1:n
          r = img(i,j,1);
          g = img(i,j,2);
          b = img(i,j,3);
          Cb = img_ycbcr(i,j,2);
          Cr = img_ycbcr(i,j,3);
%        
        if(r>=r_min & r<=r_max & g>=g_min & g<=g_max & b<=b_max & b>= b_min & Cb>=80 & Cb<=120 & Cr>=135 & Cr<=170)
            p(i,j)=1;
        end
    end
end
end