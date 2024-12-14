function toggleVisibleLight(isVisibleLight)
    global m c
      
    if (isVisibleLight)
        writeDigitalPin(m.arduino_obj, m.visible_light, 1);
        writeDigitalPin(m.arduino_obj, m.uv_light, 0);
    else
    
        writeDigitalPin(m.arduino_obj, m.visible_light, 0);
        writeDigitalPin(m.arduino_obj, m.uv_light, 1);
    end
end

