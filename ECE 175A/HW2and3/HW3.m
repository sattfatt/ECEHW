%%Sample mean of all images

load('data.mat');
load('label.mat');
%% mean
% initialize mean array
mean = zeros(784,10);
% calculate sample means for each class
for i = 1:10
    sum = zeros(784,1);
    num = 0;
    for j = 1:5000
       if labelTrain(j)==(i-1)
            sum = sum + reshape(imageTrain(:,:,j),784,1);
            num = num+1;
       end
       mean(:,i) = sum./num;
    end
end
%ensure means properly calculate
for i=1:10
    subplot(2,5,i)
    %imagesc(reshape(mean(:,i),28,28))
    imshow(reshape(mean(:,i),28,28),[])
end
%% BDR
classified = zeros(500,1); % contains classified labels

for i = 1:500
    probabilities = zeros(10,1);
    for j = 1:10
        manalobis = -0.5*(reshape(imageTest(:,:,i),784,1)-mean(:,j))'*(reshape(imageTest(:,:,i),784,1)-mean(:,j));
        constants = -0.5*log(2*pi)^28^2 + log(1/10);
        
        probabilities(j) = manalobis + constants;
    end
    % choose max arg
    [Y,I] = max(probabilities);
    classified(i) = I-1;
end
%% error calcs
PgC = zeros(10,1);
Perror = 0;
for i = 1:10
    count1 = 0;
    errorcount1 = 0;
    errorcount2 = 0;
    for j = 1:500
        if labelTest(j) == i-1
            count1 = count1 + 1;
            if labelTest(j) ~= classified(j)
                errorcount1 = errorcount1 + 1;
            end
        end
        PgC(i) = errorcount1/count1;
        if labelTest(j) ~= classified(j)
            errorcount2 = errorcount2 + 1;
        end
    end
    Perror = errorcount2/500;
end

figure;
bar([0,1,2,3,4,5,6,7,8,9],PgC)
xlabel('Class')
ylabel('P(Error|Class)')
disp('Total Probablility of Error:')
disp(Perror)

%% calculate covariance
covariances = zeros(784,784,10);
for i=1:10
    collect = zeros(1,784);
    count = 0;
    for j = 1:5000
        if(labelTrain(j)==i-1)
            collect = [collect;reshape(imageTrain(:,:,j),784,1)'];
            count = count + 1;
        end
        
    end
    covariances(:,:,i) = cov(collect(2:end,:));
end

%% display covariances
figure;
for i=1:10
    subplot(3,4,i)
    %imagesc(covariances(:,:,1))
    imshow(covariances(:,:,i),[])
end




