% a cycle consists of lifting the tray, recording a set of images
% then running the conveyor in reverse so that all items return to the 
% tray. 
function runCycles(dirName, nrCycles, labelNr, counterNr)
    global m g d c
    f = onCleanup(@() stopEverything());
    
    setCamera(c, -2, 5);
    for k = 1:nrCycles
        % Tip up the tray
        liftTray(true)

        % move objects into the camera's view
        moveConveyor(0.5, 50);
        
        % take a set of images
        for i = 1:4
            moveConveyor(0.5, 30);
            
            setCamera(c, -2, 10);
            toggleVisibleLight(false);
            pause(1.0);

            img = snapshot(c.cam);
    
            S = findUvObjects(true, img);
            
            % only record images and labels if uv object is found.
            if (length(S) == 1)
                setCamera(c, -7, 0);
                toggleVisibleLight(true);
                pause(2.5);
                
                viImg = snapshot(c.cam);
                pause(0.1);

                prefix = strcat(".\", dirName, "I_", num2str(i), "K_", num2str(k), "C_", num2str(counterNr));
                [height, width, dim] = size(img);
                imwrite(img, strcat(prefix, "_UV.jpg"));
                imwrite(viImg, strcat(prefix, "_VI.jpg"));
                myAxes=findobj(gcf,'Type','Axes');
                saveas(myAxes(2), strcat(prefix, "_LB.jpg"));
                saveLabelFile(strcat(prefix, "_LB.txt"), height, width, labelNr, S);
            end
            
            turnOffLights();
        end
    
        % run backward so all objects end up in tray
        moveConveyor(5, -70);
    end
end