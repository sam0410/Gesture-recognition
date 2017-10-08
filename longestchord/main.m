

function[e,mid,x,y] = main(bin,str)

%data 
L = 500;
delta = 5;

%im1 = rotated image
%angle = angle rotated 
%mid_point = about which the image is rotated

[out2,out,im1,angle,mid_pt] = chord_hand(bin,L,delta);
pause(2);

%locating wrist points
%mid = mid point of the wrist located
[ mid,~ ] = locate_wrist( im1,out2 );

%rotating back the mid point to original image
[mid] = rotateback(mid,angle,mid_pt);

%reading xml file to locate actual wrist pints
%e = error
%x and y wrist point coordinates
file = xmlread(str);
[ e,x,y] = erroe( mid,file ) ;
 
       

    

