% create a file containing the bounding boxes and label identifiers.
%   fileName    - name of the save file
%   imgHeight   - height of image in number of pixels
%   imgWidth    - width of image in number of pixles
%   labelNumber - integer indicating the type of object found
%   S           - array of bounding boxes identifying the given object type
function [nr_found] = saveLabelFile(fileName, imgHeight, imgWidth, labelNumber, S)
    global d g
    fileID = fopen(fileName,'w');
    
    nr_found = length(S);
    for i = 1: nr_found
        % bounding box  [xLeft, yTop, width, height]
        b = S(i).BoundingBox;
        % normalize box so values are 0 to 1
        normBox = [b(1)/imgWidth b(2)/imgHeight b(3)/imgWidth b(4)/imgHeight];
        fprintf(fileID, '%d %f %f %f %f\n', labelNumber, normBox);
    end
    
    fclose(fileID);
            
    d.nr_objects_found  = [d.nr_objects_found  length(S)];
    d.time              = [d.time toc];
    
    set(g.nr_graph,'XData', d.time,'YData', d.nr_objects_found);
    
end