camera=webcam('FaceTime HD Camera');
preview(camera);







a=[];
f  = figure('ToolBar','none');
t = uitoolbar(f);

% Read an image
[img,map] = imread(fullfile(matlabroot,...
           'toolbox','matlab','icons','matlabicon.gif'));

% Convert image from indexed to truecolor
icon = ind2rgb(img,map);

% Create a uipushtool in the toolbar
p = uipushtool(t,'TooltipString','Toolbar push button',...
                 'ClickedCallback',...
                 'workplz(snapshot(camera),bag,svmStruct);');

% Set the button icon
p.CData = icon;
    



testSet = [ imageSet(fullfile('dataset', 'test'))];
{ testSet.Description } % display all labels on one line
[testSet.Count]


        
 

 %test = read(testSet(1), 1);
 
