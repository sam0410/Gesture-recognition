
%defining parameters to be saved for analysis
error = [];
wrist_mid = [];
wrist_first = [];
wrist_second = [];


for i = 1:12
    for j = 1:3
        %storing the value in the string
        str1 = strcat('1_P_hgr1_id0',int2str(i),'_',int2str(j),'.xml');
        str = strcat('1_P_hgr1_id0',int2str(i),'_',int2str(j),'.bmp');
        
        %try to implement the function
        try 
            im = imread(strcat('C:\Users\khayati_mittal\Desktop\B.tech_2nd_sem_2017\wrist location\HGR1\hgr1_skin\skin_masks\',str));
        catch
            continue
        end
        %main function to execute to return values for given image
        %e = error calculated
        %mid is the mid point of the wrist by our analysis
        %x and y is wrist points given in the data set
        
        [e,mid,x,y] = main(im,str1);
        pause(2)
        
        %plotting the points
        imshow(im)
        hold on
        plot(x,y,'*r');
        plot(mid(2),mid(1),'*r');
        pause(2)
        
        %stoing values in array
        error = [error;e];
        wrist_mid = [wrist_mid;mid];
        wrist_first = [wrist_first;x(1),y(1)];
        wrist_second = [ wrist_second;x(2),y(2)];
        
    end
    

            
        
    end
