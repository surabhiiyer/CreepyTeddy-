function Recognize_Face(faceClassifier,personIndex,training)
% Creating a 40 class classifier using fitcecoc

%faceClassifier = fitcecoc(trainingFeatures,trainingLabel); 

% test images from the test set 
% Process one image and test 

currentimage = imread('test.jpg');
gray_scale = rgb2gray(currentimage);
temp = imresize(gray_scale,[112 92]);
imwrite(temp,'test.pgm');
% figure; 
% imshow(temp);title('temp')

%person = 1;
%queryImage = read(test(person),1); 
queryImage = imread('test.pgm'); 
queryFeatures = extractHOGFeatures(queryImage);                                             
personLabel = predict(faceClassifier, queryFeatures); 
% Mapping back to teh training set to find the identitiy 
booleanIndex = strcmp(personLabel, personIndex); 
integerIndex = find(booleanIndex);
% figure; 
% subplot(1,2,1); imshow(queryImage); title('test query face'); 
% subplot(1,2,2); imshow(read(training(integerIndex),1)); title('Matched Class') 