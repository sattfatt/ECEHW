load('data.mat');
load('label.mat')

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
minindex = zeros(500,1);% contains index of min distance for each test image
for i=1:500
    x = find(dist(:,i) == min(dist(:,i)));
    minindex(i)=x;
    class(i) = labelTrain(x);
end

%%
PgC = zeros(1,10);
PE = 0;
for c = 0:9
    x = find(labelTest==c);
    total = length(x);
    errorcount = 0;
    totalerrorcount = 0;
    for i=1:500
       if (labelTest(i)==c) && (class(i)~=labelTest(i))
           errorcount = errorcount + 1;
       end
       if (class(i)~=labelTest(i))
           totalerrorcount = totalerrorcount + 1;
       end
    end
    PgC(c+1)=errorcount/total;
    PE = totalerrorcount/500
end

figure;
bar(0:9,PgC)
xlabel('Class')
ylabel('P(error|Class)')
%%
count = 0;
for i=1:500
   if labelTest(i)~= class(i)
       figure;
       subplot(1,2,1);
       imshow(imageTest(:,:,i));
       subplot(1,2,2);
       imshow(imageTrain(:,:,minindex(i)));
       count = count+1;
       if count == 5
           break
       end
   end
end
% seems 4 and 9 are mixed up a lot








