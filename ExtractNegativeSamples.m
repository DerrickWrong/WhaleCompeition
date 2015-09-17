simages = dir('ProcessedImages');
for i=3:length(simages)
 imginp = imread(strcat('ProcessedImages/',simages(i).name));  % Read an image 
 imcropped = imcrop(imginp,[1 1 1078 670]); % Crop
 fileName = strcat('background/', simages(i).name);
 fprintf([fileName, '\n']);
 imwrite(imcropped,fileName); % Save negative images
end