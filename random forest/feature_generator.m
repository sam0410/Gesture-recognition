function [ features ] = feature_generator( bin,x,y,depth )



features = zeros(4,1);

hand_pixels = [];

total_pixels = size(x,1);
foreground_pixel = 0 ;
for i = 1:total_pixels
    if x(i)<=size(bin,1) && y(i) <= size(bin,2)
        if(bin(x(i),y(i)) == 1  )
            foreground_pixel = foreground_pixel +1;
            hand_pixels = [hand_pixels;x(i),y(i)];

        end
    end
end

percent_foreground_pixel = foreground_pixel/total_pixels;
features(1) = percent_foreground_pixel;

sum = 0;


for i = 1:size(hand_pixels,1)
    t = (bin(hand_pixels(i,1),hand_pixels(i,2))- depth(hand_pixels(i,1),hand_pixels(i,2)) +1000) / 2000;
    
    sum = sum + t;
end

features(2) = sum/foreground_pixel;

mini = min(hand_pixels);
x_cap = mini(1);
r = 0;
for i = 1:total_pixels
    if(x(i) <= x_cap(1) )
        r = r + 1;
    end
end

features(3) = r/total_pixels;
sum = 0;
for i = 1:size(hand_pixels,1)-1
    t1 = (bin(hand_pixels(i,1),hand_pixels(i,2))- depth(hand_pixels(i,1),hand_pixels(i,2)) +1000) / 2000;
    t2 = (bin(hand_pixels(i+1,1),hand_pixels(i+1,2))- depth(hand_pixels(i+1,1),hand_pixels(i+1,2)) +1000) / 2000;
    
    sum = sum + abs(t1 - t2);
end

features(4) = sum;







end

