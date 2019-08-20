function means = get_sliding_window(point_cloud, step_size, dimensions)
    % Returns the sliding window array. 

    m = size(point_cloud,1);

    means = zeros(m-step_size, numel(dimensions));

    for i = 1:(m-step_size)

        xs = point_cloud(i:i+step_size, 1);
        x_mu = mean(xs); % mean of x values 

        ys = point_cloud(i:i+step_size, 2);
        y_mu = mean(ys); % mean of y values

        % assign the means to the point cloud
        means(i,1) = x_mu;
        means(i,2) = y_mu;
        
        if (numel(dimensions) == 3) % check for z dimension
            zs = point_cloud(i:i+step_size, 3);
            z_mu = mean(zs);
            means(i,3) = z_mu;
        end
        

    end
end