%% 
%part 1

%load in the sample images for part 1
sampletest = reshape(im2double(imread('sampletest.png')),784,1);
sampletrain = reshape(im2double(imread('sampletrain.png')),784,1);

%Calculate the ML estimate of a for the sample images.
aML = (sampletrain'*sampletrain)^-1*sampletrain'*sampletest;
%%
%part 2

%load in all data
load('data.mat');

% for each test image calculate aML between each training image then
% normalize the training image by the a and calculate euclidean distance.
% find the smallest one and make that the label.
classified = zeros(500,1);
totalerrorcount = 0;
for teidx = 1:500
    euclideans = zeros(5000,1); 
    for tridx = 1:5000
        % reshape the images
        testim = reshape(imageTestNew(:,:,teidx),784,1);
        trainim = reshape(imageTrain(:,:,tridx),784,1);
        % calculate the MLE of a between the two images
        astar = (trainim'*trainim)^-1 * trainim'*testim;
        % normalize the test image
        normaltest = testim / astar;
        % calculate the euclidean distance
        euclideans(tridx) = norm(trainim - normaltest);
    end
    % find min distance in euclideans
    [val,minidx] = min(euclideans);
    % classify the test image
    classified(teidx) = labelTrain(minidx);
    % calculate total error count
    if classified(teidx) ~= labelTestNew(teidx)
        totalerrorcount = totalerrorcount + 1;
    end
end
%% 
% errors
totalerror = totalerrorcount / 500;

PgC = zeros(10,1);
for i = 1:10
   count = 0;
   errorcount = 0;
   for j = 1:500
      if labelTestNew(j) == i-1
         count = count + 1;
         if labelTestNew(j) ~= classified(j)
             errorcount = errorcount + 1;
         end
      end
   end
   PgC(i) = errorcount / count;
end

% plot class conditional errors
figure;
bar([0 1 2 3 4 5 6 7 8 9],PgC);
xlabel('Class')
ylabel('P(Error|C)')
ylim([0,0.45]);

%% 
% NN classifier from my HW 2

dist = zeros(5000,500);
for i = 1:500
    for j = 1:5000
       diff = imageTrain(:,:,j) - imageTestNew(:,:,i);
       square = diff.^2;
       total = sum(sum(square));
       root = total^0.5;
       dist(j,i) = root;
    end
end

nnclass = zeros(500,1);
nnminindex = zeros(500,1);% contains index of min distance for each test image
for i=1:500
    x = find(dist(:,i) == min(dist(:,i)));
    nnminindex(i)=x;
    nnclass(i) = labelTrain(x);
end

NNPgC = zeros(1,10);
NNPE = 0;
for c = 0:9
    x = find(labelTestNew==c);
    total = length(x);
    nnerrorcount = 0;
    nntotalerrorcount = 0;
    for i=1:500
       if (labelTestNew(i)==c) && (nnclass(i) ~= labelTestNew(i))
           nnerrorcount = nnerrorcount + 1;
       end
       if (nnclass(i)~=labelTestNew(i))
           nntotalerrorcount = nntotalerrorcount + 1;
       end
    end
    NNPgC(c+1)=nnerrorcount/total;
    NNPE = nntotalerrorcount/500;
end

figure;
bar(0:9,NNPgC)
xlabel('NN Class')
ylabel('P(error|Class)')




