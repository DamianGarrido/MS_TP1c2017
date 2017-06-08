% Create figure
figure_handle = figure('Toolbar','none');
% create structure of handles
myhandles = guihandles(figure_handle); 
% Add some additional data as a new field called numberOfErrors
myhandles.numberOfErrors = 0; 
% Save the structure
guidata(figure_handle,myhandles) 