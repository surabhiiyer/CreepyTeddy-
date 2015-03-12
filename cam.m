camera=webcam('FaceTime HD Camera');
preview(camera);

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
                 'a=snapshot(camera)');

% Set the button icon
p.CData = icon;
    
    




% img=snapshot(camera);
% img=snapshot(camera);
% img=snapshot(camera);
% img=snapshot(camera);
% imshow(img)
% clear(camera);