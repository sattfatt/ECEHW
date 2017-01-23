dist = zeros(5000,500);
%diff = zeros(5000,500);
for i = 1:500
    for j = 1:5000
       diff = imageTrain(:,:,j) - imageTest(:,:,i);
       square = diff.^2;
       total = sum(sum(square));
       root = total^0.5;
       dist(j,i) = root;
    end
end
%%
class = zeros(500,1);
for i=1:500
    x = find(dist(:,i) == min(dist(:,i)));
    class(i) = labelTrain(x);
end

%%
PgC = zeros(1,10);
for c = 0:9
    x = find(labelTest==c);
    total = length(x);
    
    
end