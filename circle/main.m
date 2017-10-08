

function[e,mid,x,y] = main(bin,file)

%data 


%im1 = rotated image
%angle = angle rotated 
%mid_point = about which the image is rotated

[mid] = forearm_segment_size_main(bin );
pause(2);



%reading xml file to locate actual wrist pints
%e = error
%x and y wrist point coordinates
% file = xmlread(strcat('C:\Users\khayati_mittal\Desktop\B.tech_2nd_sem_2017\wrist location\HGR1\hgr1_feature_pts\feature_points\',str1));

[ e,x,y] = erroe( mid,file ) ;
end

 
       

    

