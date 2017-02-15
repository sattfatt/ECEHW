function explore_map = update_explore_map(dest, route, explore_map, PLANNED, UNMAPPED)
% Write this function so that all the locations specified in route and dest
% are marked as PLANNED only if it was previous UNMAPPED in the explore_map
% variable.

if explore_map(dest) == UNMAPPED
    explore_map(dest) = PLANNED;
end

for i=1:size(route,1)
    if explore_map(route(i,:)) == UNMAPPED
        explore_map(route(i,:)) = PLANNED;
    end
end


end