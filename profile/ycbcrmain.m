%defining parameters to be saved for analysis
errorCircle = [];
            positive = 0;
            negative = 0;


for k = 1:31
    for i = 1:13
        for j = 1:3
            if k>5
                ch = char('A'+k-6);
            else
                ch = int2str(k);
            end
            try
            %storing the value in the string
            s = sprintf('%02d',i);

            str1 = strcat(ch,'_P_hgr1_id',s,'_',int2str(j),'.xml');
            str = strcat(ch,'_P_hgr1_id',s,'_',int2str(j),'.jpg');
            image = strcat('C:\Users\sam\Desktop\wristlocalization\hgr1_images\original_images\',str);
            %str = strcat('1_P_hgr1_id0',int2str(i),'_',int2str(j),'.jpg');
            file = strcat('C:\Users\sam\Desktop\wristlocalization\hgr1_feature_pts\feature_points\',str1);
            I=imread(image);
            [~,bin] = generate_skinmap(I) ;
            
            catch
                continue
            end

            %Chord hand implementation to execute to return values for given image
            %e = error calculated
            %mid is the mid point of the wrist by our analysis
            %x and y is wrist points given in the data sets

            [e,mid,x,y] = main(bin,file);
            pause(2);

            if e <= 0.5
                positive = positive+1;
            else
                negative = negative+1;
            end

            efficiency = positive/(negative+positive);




            %storing values in array
            errorCircle = [errorCircle,e];

            %im = input image
            %[e,mid,x,y] = forearm_segment_size_main(im,str1);
            pause(2)

            %plotting the points
            imshow(bin)

            hold on
            plot(x,y,'*r');
            plot(mid(2),mid(1),'*b');
            pause(2)
            close all;
            
        end
    end

end