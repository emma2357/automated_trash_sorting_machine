% return bounding boxes for any items that match the UV mask within the image.
function S = findUvObjects(plotImg, img)
    % use color Thresholder to tune the createUVMask function 
    msk = createUVMask(img);

    % remove small segments
    BW2 = bwareafilt(msk,[500 10000000]);

    % compute bounding boxes 
    S = regionprops(BW2,'BoundingBox');

    if (plotImg)  
        imshow(img)
        for i = 1:length(S)
            rectangle('Position', S(i).BoundingBox, 'EdgeColor','r', 'LineWidth', 1)
        end
    end
end