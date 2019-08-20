function [new_peaks, new_locs] = get_peaks(xs)
    
    [peaks, locs] = findpeaks(xs);
    
    max_loc_distance = locs(2) - locs(1);

    new_locs = zeros(1,size(locs,1));
    new_locs(1) = locs(1);
    new_peaks = zeros(1,size(locs,1));
    new_peaks(1) = peaks(1);

    index = 2;

    for i = 1:numel(locs)-1

        loc_distance = locs(i+1) - locs(i);

        if (loc_distance > max_loc_distance/2)
            new_locs(index) = locs(i+1);
            new_peaks(index) = peaks(i+1);
            index = index + 1;

            if (loc_distance > max_loc_distance)
                max_loc_distance = loc_distance;
            end
        end
    end
        
    new_locs(new_locs == 0) = []; % remove 0 elements in array 
    new_peaks(new_peaks == 0) = []; % remove 0 elements in array
end