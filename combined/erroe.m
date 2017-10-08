function [  e ] = erroe( midpt,x,y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here




%finding the actual mid_point
slope = (y(2) - y(1))/(x(2) - x(1));

num = abs((midpt(2) - y(1) - slope*(midpt(1)-x(1)))/(sqrt(slope^2 +1)));

 
 %calculating error
%  num = dist(midpt,mid_pt);
 den = dist([x(1),y(1)],[x(2),y(2)]);
 e = num/den;
end

