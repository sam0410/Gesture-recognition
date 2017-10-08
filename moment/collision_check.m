function [ pixel_match ] = collision_check( P,Q,bin )




[x,y]=bresenham(P(1),P(2),Q(1),Q(2));
%     plot(y,x);
    
    %initialize pixel match
    pixel_match = 1;
    
    line_length = length(x);
    
    %check if given line segment lies on skin pixels 
    for i = 1:line_length
        if bin(x(i),y(i)) ~= 1
            pixel_match = 0;
            break;
        end
    end


end

