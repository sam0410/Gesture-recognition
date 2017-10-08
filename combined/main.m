

function[e_circle,mid_circle,e_chord,mid_chord,e_moment,mid_moment,x,y] = main(bin,file)

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



%circle selection method
[mid_circle] = forearm_segment_size_main(bin);
[ e_circle] = erroe( mid_circle,x,y) ;

%longest chord method

L = 500;
delta = 5;

[out2,out,im1,angle,mid_pt] = chord_hand(bin,L,delta);
pause(2);

%locating wrist points
%mid = mid point of the wrist located
[ mid,~ ] = locate_wrist( im1,out2 );

%rotating back the mid point to original image
[mid_chord] = rotateback(mid,angle,mid_pt);

[ e_chord] = erroe( mid_chord,x,y) ;


% moment method
[out2,im1,~,~] = chord_hand_moment(bin);
pause(1);

%locating wrist points
%mid = mid point of the wrist located
[ mid_moment,~ ] = locate_wrist( im1,out2 );
[ e_moment] = erroe( mid_moment,x,y) ;



end

 
       

    

