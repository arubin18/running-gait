function point_cloud = get_point_cloud(person, speed, divider, features, dimensions, sides)
    % Returns the point cloud of an inputed runner with an inputed speed. 

    if (str2double(person) < 10)
        filename = strcat("math412_dataset/","RBDS00",person,"runT",speed,"markers.txt");
    else
        filename = strcat("math412_dataset/","RBDS0",person,"runT",speed,"markers.txt");
    end
    
    data = tdfread(filename);
    datanames = fieldnames(data); % column names of the struct
    datacell = struct2cell(data);
    row_length = numel(data.Time)/divider;
    length = (row_length-1)*numel(features)*numel(sides);
    point_cloud = zeros(length,numel(dimensions));

    index = 1;
    for i = 1:row_length
        for j = 1:numel(features)
            for s = 1:numel(sides)
                values = double(3);
                for d = 1:numel(dimensions)
                    element = strcat(sides(s),features(j), dimensions(d));
                    ind = find(ismember(datanames, element)); % get the index of the column name in the struct
                    value = datacell{ind}(i);
                    values(d) = value;

                end
                point_cloud(index, :) = values;
                index = index + 1;
            end
        end
    end
end
