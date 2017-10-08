function [ dist_h, dist_v ,dist_h_nnz, dist_v_nnz ] = profile( Im )
% horizontal and vertical prijection
% dist_h/v is the diff bw 1st n last while nnz in number nonzero points
rows = size(Im,1);
cols = size(Im,2);
dist_h = zeros(rows, 1);  % vector of distances of contour points
dist_v = zeros(1,cols);


% Compute the distances %%%% horizontal projection
for r=1:rows
    s = find(Im(r,:), 1, 'first');
    e = find(Im(r,:), 1, 'last');
    if(~isempty(s) && ~isempty(e))
        dist_h(r) = e - s;
%         plot(s, r, 'xg');
%         plot(e, r, 'xr');
    end
    dist_h_nnz(r,1)=nnz(Im(r,:));
end
%% calculate vertical projection
for v=1:cols
    s = find(Im(:,v), 1, 'first');
    e = find(Im(:,v), 1, 'last');
    if(~isempty(s) && ~isempty(e))
        dist_v(v) = e - s;
%         plot(s, v, 'xg');
%         plot(e, v, 'xr');
    end
    dist_v_nnz(v)=nnz(Im(:,v));
end

end

