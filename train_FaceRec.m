faceDatabase = imageSet('att_faces','recursive'); 
% figure;
% montage(faceDatabase(1).ImageLocation); 
% title('Single Face')

personToQuery = 1; 
galleryImage = read(faceDatabase(personToQuery),1); 

%imshow(galleryImage);

%Dividing the training and testing data 
% for i = 1:size(faceDatabase,2)
%     [training, test] = partition(faceDatabase, [0.8,0.2]); 
% end

% Partitioniing the database into training and testing 
% 
% Dividing the training and testing data 

[training, test] = partition(faceDatabase, [0.8,0.2]); 
person = 1; 

%Hog features for one person in the trainig set. 

[hofFeatures, visualization] = ... 
    extractHOGFeatures(read(training(person),1));
% figure; 
% 
% %Find the hog features and display it 
% subplot(2,1,1); 
% imshow(read(training(person),1)); title('Input Face'); 
% subplot(2,1,2); 
% plot(visualization); 
% title('Hog Features'); 

% Extract the hog features for the training set 
trainingFeatures = zeros(size(training,2)*training(1).Count,4680); 

featureCount = 1; 
for i = 1:size(training,2)
    for j = 1:training(i).Count 
        trainingFreatures(featureCount,:) = extractHOGFeatures(read(training(i),2)); 
        trainingLabel{featureCount} = training(i).Description; 
        featureCount = featureCount+1; 
    end
personIndex{i} = training(i).Description;     
end
% Creating a 40 class classifier using fitcecoc
faceClassifier = fitcecoc(trainingFeatures,trainingLabel); 
