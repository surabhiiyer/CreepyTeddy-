function workplz(a,bag,svmStruct) 
if ~isempty(a)
 test = a;
 test = imresize(test,0.25);

 
 fvtest = encode(bag, test);

result = zeros(length(fvtest(:,1)),1);


%classify test cases
for j=1:size(fvtest,1)
    for k=1:3
        if(svmclassify(svmStruct(k),fvtest(j,:))) 
            break;
        end
    end
    result(j) = k
end

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
