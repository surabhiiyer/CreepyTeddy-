function project2()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load Image Sets
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%imageSet(fullfile('dataset', 'Faces_easy')), ...
%            imageSet(fullfile('dataset', 'cup')), ...
%            imageSet(fullfile('dataset', 'pizza')), ...
%

imgSets = [ imageSet(fullfile('dataset', 'ceiling_fan')), ...
            imageSet(fullfile('dataset', 'scissors'))];
{ imgSets.Description } % display all labels on one line
[imgSets.Count] 

  testSet = [ imageSet(fullfile('dataset', 'test'))];
{ testSet.Description } % display all labels on one line
[testSet.Count]
        



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Create a Visual Vocabulary and Train an Image Category Classifier
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 


 bag = bagOfFeatures(imgSets);
 
 features =[];
 output=[];
 
 for j=1:4
     for i = 1:imgSets(j).Count
         j
        img = read(imgSets(j), i);
        features = [features;encode(bag, img)];
        output = [output;j];
     end    
 end

%  fvp=[];
%  for i = 1:imgSets(1).Count
%      p = read(imgSets(1), i);
%      fvp = [fvp;encode(bag, p)];
%  end
%  
% 
%  
% fvb=[];
%  for i = 1:imgSets(2).Count
%      b = read(imgSets(2), i);
%     % b=b(1 : 2 : end, 1 : 2 : end); 
%      fvb = [fvb;encode(bag, b)];
%  end

 test = read(testSet(1), 1);
 
 fvtest = encode(bag, test);
%  x= ones(imgSets(1).Count,1);
%  y = 2 * ones(imgSets(2).Count,1);
%  output=[x;y];
%  features = [fvp;fvb];

 svmStruct = svmtrain(features,output);
 
 g=svmclassify(svmStruct,fvtest)
 
 
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
