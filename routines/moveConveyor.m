% start the conveyor belt for a given time at a given speed.
function moveConveyor(timeInSec, speedPercent)
    global m

    f = onCleanup(@() stopEverything());
    
    if (abs(speedPercent) > 100)
        speedPercent = 0;
    end
    
    writePosition(m.conveyor_obj, 0.5 + speedPercent / 100.0 * 0.5);
    pause(timeInSec);
    writePosition(m.conveyor_obj, 0.5);
end
