import edu.stanford.math.plex4.*;

person = "14";
speed = "45";
divider = 1; % divides number of rows in data.Time
step_size = 20;
features = ["Heel0x2EBottom"];
% features = ["Thigh0x2ETop0x2EMedial"];
dimensions = ["X","Y"];
sides = ["L0x2E"];

point_cloud = get_point_cloud(person, speed, divider, features, dimensions, sides);
means = get_sliding_window(point_cloud, step_size, dimensions);
stride_path = get_median_stride_path(means, dimensions);
m_space = metric.impl.EuclideanMetricSpace(stride_path);

max_dimension = 2;
max_filtration_value = 15*round(get_distance(m_space));
num_divisions = 1000;
stream = api.Plex4.createVietorisRipsStream(m_space, max_dimension,max_filtration_value, num_divisions);

persistence = api.Plex4.getModularSimplicialAlgorithm(max_dimension, 2);
 
% compute the intervals
intervals = persistence.computeIntervals(stream);

% stride length
stride_length = num2str(get_stride_length(person, speed, divider, features, dimensions, step_size));
 
% create the barcode plots
options.filename = strcat("Person ",person," with Speed ", speed, " and Stride Length ", stride_length);
options.max_filtration_value = max_filtration_value;
options.max_dimension = max_dimension - 1;
plot_barcodes(intervals, options);