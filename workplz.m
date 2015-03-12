function workplz(a,bag,svmStruct,faceClassifier,personIndex,training) 
if ~isempty(a)
 test = a;
 test = imresize(test,0.25);

 imwrite(test,'test.jpg');
 
 fvtest = encode(bag, test);

result = 0;


%classify test cases
%for j=1:size(fvtest,1)
    for k=1:3
        if(svmclassify(svmStruct(k),fvtest(1,:))) 
            break;
        end
    end
    result = k
%end

if (result == 1)
    Recognize_Face(faceClassifier,personIndex,training);
    [y,Fs] = audioread('stranger.m4a');
    sound(y,Fs)
elseif (result == 2)
    Recognize_Face(faceClassifier,personIndex,training);
    [y,Fs] = audioread('touch.m4a');
    sound(y,Fs)
elseif (result == 3)
    Recognize_Face(faceClassifier,personIndex,training);
    [y,Fs] = audioread('money.m4a');
    sound(y,Fs)
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
