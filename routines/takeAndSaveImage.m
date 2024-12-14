function img = takeAndSaveImage(plotImg, fullname)
    global c
    
    img = snapshot(c.cam);
    imwrite(img, fullname);
    
    if (plotImg)
        imshow(img);
    end
end
