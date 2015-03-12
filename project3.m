function project3()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load Image Sets
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%imageSet(fullfile('dataset', 'ceiling_fan')), ...
            %imageSet(fullfile('dataset', 'cup')), ...
            %            imageSet(fullfile('dataset', 'pizza')), ...

%simg = imresize(simg,0.25);

imgSets = [ imageSet(fullfile('dataset', 'Faces_easy')), ...
            imageSet(fullfile('dataset', 'pizza')), ...
            imageSet(fullfile('dataset', 'scissors'))];
{ imgSets.Description } % display all labels on one line
[imgSets.Count] 

  testSet = [ imageSet(fullfile('dataset', 'test'))];
{ testSet.Description } % display all labels on one line
[testSet.Count]
        



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Get the feature of each img set 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 


 bag = bagOfFeatures(imgSets);
 
 
 
 features =[];
 output=[];
 
 for j=1:3
     for i = 1:imgSets(j).Count
        img = read(imgSets(j), i);
        features = [features;encode(bag, img)];
        output = [output;j];
     end    
 end


 test = read(testSet(1), 1);
 test = imresize(test,0.25);
 %test = simg;
 
 fvtest = encode(bag, test);

u=unique(output);
numClasses=length(u);
result = zeros(length(fvtest(:,1)),1);

%build models
for k=1:3
    %Vectorized statement that binarizes Group
    %where 1 is the current class and 0 is all other classes
    G1vAll=(output==u(k));
    svmStruct(k) = svmtrain(features,G1vAll);
end



%classify test cases
for j=1:size(fvtest,1)
    for k=1:numClasses
        if(svmclassify(svmStruct(k),fvtest(j,:))) 
            break;
        end
    end
    result(j) = k
end
 
 %cp =classperf(output)
%classperf(cp,g,test);cp.CorrectRate
 

% 
% categoryClassifier = trainImageCategoryClassifier(trainingSets, bag);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Evaluate Classifier Performance
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% confMatrix = evaluate(categoryClassifier, trainingSets);
% 
% confMatrix = evaluate(categoryClassifier, validationSets);
% 
% % Compute average accuracy
% mean(diag(confMatrix));
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Try the Newly Trained Classifier on Test Images
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% img = imresize(imread(fullfile('lappy.jpg')),0.1);
% [labelIdx, scores] = predict(categoryClassifier, img);
% 
% % Display the string label
% categoryClassifier.Labels(labelIdx)
% 
% 
% 
% 
% 
% 
