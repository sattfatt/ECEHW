function dest = get_new_destination(curPos, unexplored_areas)
% Write this function so that it will pick the closest unexplored area
% as the new destination dest. We will keep this function simple by
% ignoring any walls that may block our path to the new destination. Here
% we define "closest" using the euclidean distance measure,
% e.g. sqrt((x1-x2)^2 + (y1-y2)^2).

% The lines below are not part of the solution and are only written here
% so that runMe.m can actually run without having written the functions yet
%dest = unexplored_areas(randi(size(unexplored_areas,1)),:);

sizeofunexplored = size(unexplored_areas,1);
distances = zeros(sizeofunexplored,1);
for i = 1:sizeofunexplored
    distances(i) = sqrt((curPos(1)-unexplored_areas(i,1))^2 + (curPos(2)-unexplored_areas(i,2))^2);
end
minindex = find(distances==min(distances));
dest = unexplored_areas(datasample(minindex,1),:);
end

