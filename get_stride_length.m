function avg_stride = get_stride_length(person, speed, divider, features, dimensions, step_size)

    sides1 = ["L0x2E"]; % left foot
    sides2 = ["R0x2E"]; % right foot

    left_point_cloud = get_point_cloud(person, speed, divider, features, dimensions, sides1);
    left_means = get_sliding_window(left_point_cloud, step_size, dimensions);

    max_left_x = max(left_means(:,1));
    min_left_x = min(left_means(:,1));

    right_point_cloud = get_point_cloud(person, speed, divider, features, dimensions, sides2);
    right_means = get_sliding_window(right_point_cloud, step_size, dimensions);

    max_right_x = max(right_means(:,1));
    min_right_x = min(right_means(:,1));

    stride1 = max_left_x - min_right_x;
    stride2 = max_right_x - min_left_x;

    avg_stride = (stride1 + stride2) / 2;
    
end
