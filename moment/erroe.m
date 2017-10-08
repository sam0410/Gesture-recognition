function [  e,x,y  ] = erroe( midpt,file )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here



x= [];
y= [];

%converting file to structure
[ s ] = xml2struct( file );
sk = s.IMAGE.hand{1,1}.FeaturePoint;

%acessing the wrist points and storing in x and y
for i = 1:size(sk,2)
   k = strcmp(sk{1,i}.Attributes.category ,'Wrist');
   if k ~= 0
      x = [x,str2double(sk{1,i}.Attributes.x)];
      y = [y,str2double(sk{1,i}.Attributes.y)];
   end
end

%finding the actual mid_point
slope = (y(2) - y(1))/(x(2) - x(1));

num = abs((midpt(2) - y(1) - slope*(midpt(1)-x(1)))/(sqrt(slope^2 +1)));

 
 %calculating error
%  num = dist(midpt,mid_pt);
 den = dist([x(1),y(1)],[x(2),y(2)]);
 e = num/den;
end

