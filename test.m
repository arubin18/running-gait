person = "2";
speed = "45";
divider = 1; % divides number of rows in data.Time
step_size = 10;
features = ["Heel0x2EBottom"];
% features = ["Thigh0x2ETop0x2EMedial"];
dimensions = ["X","Y", "Z"];
sides = ["L0x2E"];

stride_path = get_median_stride_path(person, speed, divider, features, dimensions, sides);

figure
% scatter3(values(:,1), values(:,2), values(:,3),'.')
scatter(stride_path(:,1), stride_path(:, 2), stride_path(:,3), '.')
axis equal
view(60,40)