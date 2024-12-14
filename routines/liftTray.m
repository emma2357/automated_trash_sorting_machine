% Lift the tray pouring items onto the conveyor
function liftTray(spinConveyor)
    global m u

    % start the conveyor
    if (spinConveyor)
        writePosition(m.conveyor_obj, 0.65);
    end
    
    % move the tray up in increments so that items are
    % evenly poured onto the conveyor.
    for j = 1:7 
        writePosition(m.tray_obj, 0.4 - j * 0.03);
        pause(0.8)
    end

    % return tray to starting position
    writePosition(m.tray_obj, 0.6);
    
    % stop the conveyor
    writePosition(m.conveyor_obj, 0.5); 
end