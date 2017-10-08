function [ out,P_max,Q_max,d_max ] = local_search( p,q,P,Q,C,delta,bin )




%p and q are index of P and Q in matrix co_ordinates

[r,c,~] = find(C);

co_ordinates = [ r c ] ;

%CHANGE THE CONDITION FOR END POINTS
if  p-delta< length(co_ordinates)
    P_2 = P;
else
    P_2 = co_ordinates(p-delta,:);
end

if  p+delta> length(co_ordinates)
    P_3 = P;
else
    P_3 = co_ordinates(p+delta,:);
end

if  q-delta< length(co_ordinates)
    Q_2 = Q;
else
    Q_2 = co_ordinates(q-delta,:);
end

if  q+delta> length(co_ordinates)
    Q_3 = Q;
else
    Q_3 = co_ordinates(q+delta,:);
end


contour_matrix_P = [P;P_2;P_3];
contour_matrix_Q = [Q;Q_2;Q_3];

X = P;
Y = Q;

%check the maximum distance between two contour matrices
d_max = dist(P,Q);
for i =1:3
    for j = 1:3
        d = dist(contour_matrix_P(i,:),contour_matrix_Q(j,:));
        if (d > d_max) && collision_check(contour_matrix_P(i,:),contour_matrix_Q(j,:),bin)
            X = contour_matrix_P(i,:);
            Y = contour_matrix_Q(j,:);
        
        end
    end
end

%local search imroving the result

if dist(P,Q) < dist(X,Y)
    P_max = X;
    Q_max = Y;
    d_max = dist(X,Y);
    out = 1;
else
    %initial was the longest
    P_max = P;
    Q_max = Q;
    d_max = dist(P,Q);
    out = 0;
end
    


end

