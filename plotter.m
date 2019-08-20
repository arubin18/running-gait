import edu.stanford.math.plex4.*;
import mlreportgen.dom.*;

person = "13";
speed = "25";
divider = 1; % divides number of rows in data.Time
step_size = 20;
% features = ["Heel0x2EBottom"];
features = ["Thigh0x2ETop0x2EMedial"];
dimensions = ["X","Y","Z"];
sides = ["L0x2E"];
data_name = "stride_path";
path = "thigh-top-medial/";

point_cloud = get_point_cloud(person, speed, divider, features, dimensions, sides);
means = get_sliding_window(point_cloud, step_size, dimensions);
stride_path = get_median_stride_path(means, dimensions);

data = eval(data_name);
output_name = strcat(path,"person",person,"_speed",speed,"_",data_name,"_divider",num2str(divider),"_stepsize",num2str(step_size),".jpeg");

f = figure('visible','off');
scatter3(data(:,1),data(:,2),data(:,3), '.')
axis equal
view(60,40)
saveas(f, output_name)


