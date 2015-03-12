% Need to run this on all the training data. 

% load images from the att face database 
faceDatabase = imageSet('/Users/surabhiravishankar/Documents/MATLAB/ML_Proj/att_faces','recursive'); 
figure;
montage(faceDatabase(1).ImageLocation); 
title('Single Face')

personToQuery = 1; 
galleryImage = read(faceDatabase(personToQuery),1); 

% Divide the training and testing set 
[training, test] = partition(faceDatabase, [0.8,0.2]); 
person = 1; 

% Extract the features for the entire training database: 
trainingFeatures = zeros(size(training,2)*training(1).Count,4680); 

featureCount = 1; 
for i = 1:size(training,2)
    for j = 1:training(i).Count 
        
        % Fisher vector Feature extraction
        [features, locations] = helperExtractDenseSURF(read(training(i),2)); 
        % Reduce the surf dimensionalit to 64 
        featuresReduced = features * surfPCA.pcaCoeff; 
        %perform  spatial augmentation 
        descriptors = [featuresReduced, locations]; 
        %Encode as fisher vector 
        queryFisherVector = helperEncodeFisherVector(descriptors, ...
                                                fisherGMM.GMModel); 
        
        trainingFreatures(featureCount,:) = extractHOGFeatures(read(training(i),2)); 
        trainingLabel{featureCount} = training(i).Description; 
        featureCount = featureCount+1; 
    end
personIndex{i} = training(i).Description;     
end


% Fisher vector Feature extraction
[features, locations] = helperExtractDenseSURF(queryFace); 
% Reduce the surf dimensionalit to 64 
featuresReduced = features * surfPCA.pcaCoeff; 
%perform  spatial augmentation 
descriptors = [featuresReduced, locations]; 
%Encode as fisher vector 
queryFisherVector = helperEncodeFisherVector(descriptors, ...
                                                fisherGMM.GMModel); 