clear
clear global

addpath(".\source\");

global m u g d c

h = gcf;
set(h, "Position", [0 0 1000 1000])

% Create Save directories
mkdir("Results")

% Setup structures
u = userSettings();
m = setupMachine(); 
c = setupCamera();
d = setupDataStore();
g = setupGraphs();

% initial settings
turnOffLights();

tic 

% Menu
while (true)
    disp('Beginning a new test. Press control-C to exit.');
    disp('Select an option:')
    disp('  R - Run conveyor')
    disp('  V - Take Visible Image')
    disp('  U - Take UV Image')
    disp('  M - Move Conveyor Forward')
    disp('  B - Move Conveyor Backward')
    disp('  O - Turn off everything')
    disp('  S - Set exposure and brightness')
    disp('  L - Lift basket')
    disp('  Q - quit')
    
    option = input("Enter Option: ", "s");
    if (option == "R")
        nrCycles = input("Number of cycles per label:");
        runLabels(nrCycles);
    elseif (option == "V")
        toggleVisibleLight(true);
        pause(0.5)
        takeAndSaveAnImage("VIS.jpg");
    elseif (option == "U")
        toggleVisibleLight(false);
        pause(0.5)
        img = takeAndSaveImage("UV.jpg");
        S = findUVObjects(true, img);
        [height, width, dim] = size(image);
        saveLabelFile("UV_labels.txt", height, width, 0, S);
    elseif (option == "M")
        moveConveyor(3, 95);
    elseif (option == "B")
        moveConveyor(3, -95);
    elseif (option == "O")
        stopEverything();
    elseif (option == "L")
        liftTray(true);
    elseif (option == "S")
        exp = input("Exposure:");
        bri = input("Brightness:");
        setCamera(round(str2double(exp)), round(str2double(bri)));        
    elseif (option == "Q")
        custom_error("Quit.")
    else
        disp("Incorrect selection. Try again.")
    end
end

