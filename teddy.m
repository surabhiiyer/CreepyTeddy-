
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Training
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%calling the training scripts

if (~exist('trained'))
trainobject
end
trained=true;
if (~exist('trainedFace'))
train_FaceRec
end
trainedFace=true;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% intialize camera 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if (~exist('camera'))
camera=webcam('FaceTime HD Camera');
end
preview(camera);


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create window with the capture button
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read an image
[img,map] = imread(fullfile(matlabroot,...
           'toolbox','matlab','icons','matlabicon.gif'));

% Convert image from indexed to truecolor
icon = ind2rgb(img,map);

% Create a uipushtool in the toolbar
f  = figure('ToolBar','none');
t = uitoolbar(f);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% when the button is detected it will take a snapshot and and call the
% detectObject function 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p = uipushtool(t,'TooltipString','Toolbar push button',...
                 'ClickedCallback',...
                 'detectObject(snapshot(camera),bag,svmStruct,faceClassifier,personIndex,training);');

% Set the button icon
p.CData = icon;
    



