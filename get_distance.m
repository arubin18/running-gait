function rounded_distance = get_distance(m_space)
    % Returns max distance between consecutive points in the m_space array.

    m = size(m_space);

    max = 0;

    for i = 0:m-2

        dist = m_space.distance(m_space.getPoint(i), m_space.getPoint(i+1));

        if (dist > max)
            max = dist;
        end

    end

    rounded_distance = round(max);

    dif = max - rounded_distance;

    if (dif > 0) % opposite of truncating
        rounded_distance = rounded_distance + 1;
    end
    
end

