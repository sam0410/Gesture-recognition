%defining parameters to be saved for analysis
errorCircle = [];
errorChord = [];
errorMoment = [];
filename = [];
positive = 0;
negative = 0;
for k = 1:5
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
            str = strcat(ch,'_P_hgr1_id',s,'_',int2str(j),'.bmp');
            image = strcat('C:\Users\khayati_mittal\Desktop\wristlocalization\hgr1_skin - Copy\skin_masks\',str);
            %str = strcat('1_P_hgr1_id0',int2str(i),'_',int2str(j),'.jpg');
            file = strcat('C:\Users\khayati_mittal\Desktop\wristlocalization\hgr1_feature_pts\feature_points\',str1);
            bin=imread(image);
            bin = 1-bin;
            
            catch
                continue
            end

            %Chord hand implementation to execute to return values for given image
            %e = error calculated
            %mid is the mid point of the wrist by our analysis
            %x and y is wrist points given in the data sets

            [e_circle,mid_circle,e_chord,mid_chord,e_moment,mid_moment,x,y] = main(bin,file);
            pause(0.5);
            close all force
            
            errorCircle = [errorCircle;e_circle];
            errorChord = [errorChord;e_chord];
            errorMoment = [errorMoment;e_moment];
            filename = [filename;str];
            

            pause(0.2)

            %plotting the points
            imshow(bin)

            hold on
            plot(x,y,'*r');
            plot(sum(x)/2,sum(y)/2,'*r');
            plot(mid_chord(2),mid_chord(1),'*b');
            plot(mid_moment(2),mid_moment(1),'*m');
            plot(mid_circle(1),mid_circle(2),'*g');
            
            
            pause(0.2)
            hold off
            close all force;
            
        end
    end

end