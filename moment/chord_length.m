function [ profile_length ] = chord_length( y,im )




profile_length = 0;

for i = 1:size(im,1)
    if im(i,y) == 1;
        profile_length = profile_length +1;
    end
end



end

