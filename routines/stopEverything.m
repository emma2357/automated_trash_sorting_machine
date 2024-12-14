% stop conveyor and turn off the lights.
function stopEverything()
    global m

    disp("Wait for cleanup")
    writeDigitalPin(m.arduino_obj, m.visible_light, 0);
    writeDigitalPin(m.arduino_obj, m.uv_light, 0);
    writePosition(m.conveyor_obj, 0.5);
    
end