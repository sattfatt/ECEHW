%%Sample mean of all images

load('data.mat');
load('label.mat');
% initialize mean array
mean = zeros(784,10);

for i = 1:10
    sum = zeros(784,1);
    num = 0;
    for j = 1:5000
       if labelTrain(j)==(i-1)
            sum = sum + reshape(imageTrain(:,:,J),784,1);
            num = num+1;
       end
       mean(:,i) = mum./num;
    end
end

