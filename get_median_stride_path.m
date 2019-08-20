function values = get_median_stride_path(point_cloud, dimensions)
    
    xs = point_cloud(:,1);

    [~, locs] = get_peaks(xs);

    locs_a = locs(2:end);
    locs_b = locs(1:(end-1));

    time = 1:numel(xs);
    
    median_stride_time = median(locs_a - locs_b);

    median_st = round(median_stride_time); % rounded median stride length

    values = zeros(median_st, numel(dimensions));

    for i = 1:median_st
        find_locs = i + (1:(numel(time)/median_st - 1))*median_st;
        points = zeros(numel(find_locs), numel(dimensions));

        for j = 1:numel(find_locs)
            points(j,:) = point_cloud(find_locs(j),:);
        end
        avg_points = mean(points);
        values(i,:) = avg_points;

    end
end