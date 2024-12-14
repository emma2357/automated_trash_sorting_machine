function turnOffLights()
    global m
    writeDigitalPin(m.arduino_obj, m.visible_light, 0);
    writeDigitalPin(m.arduino_obj, m.uv_light, 0);
end

