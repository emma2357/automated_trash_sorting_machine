% ------------------------------------------------------------------
% m - Machine Objects
% ------------------------------------------------------------------
% Pin Layout
% D2 / D3 - HX711 senor giving the force reading
% D5      - Motor Changing the Curvature PWM 
% D6      - Motor Moving the Load Cell PWM 
% D7     - Limit Switch Upper
% D4     - Limit Switch Lower
function m = setupMachine()    
    global u m
    m = struct();
    m.conveyor_pin          = "D5";
    m.tray_pin              = "D6";
    m.arm_x_pin             = "D3";
    m.arm_z_pin             = "D10";
    m.arm_grip_pin          = "D9";
    m.visible_light         = "D12";
    m.uv_light              = "D8";
  
    
    m.arduino_obj     = arduino("com3", "Uno", "libraries", {"Servo"});
    m.conveyor_obj    = servo(m.arduino_obj, m.conveyor_pin, 'MinPulseDuration', 1050e-6, 'MaxPulseDuration', 1950e-6);
    m.tray_obj        = servo(m.arduino_obj, m.tray_pin, 'MinPulseDuration', 1050e-6, 'MaxPulseDuration', 1950e-6);
    writePosition(m.tray_obj, u.trayDownPos);
        
    m.arm_x           = servo(m.arduino_obj, m.arm_x_pin, 'MinPulseDuration', 1050e-6, 'MaxPulseDuration', 1950e-6);
    m.arm_z           = servo(m.arduino_obj, m.arm_z_pin, 'MinPulseDuration', 1050e-6, 'MaxPulseDuration', 1950e-6);
    m.arm_grip        = servo(m.arduino_obj, m.arm_grip_pin, 'MinPulseDuration', 1050e-6, 'MaxPulseDuration', 1950e-6);

    configurePin(m.arduino_obj, m.visible_light, 'DigitalOutput');
    configurePin(m.arduino_obj, m.uv_light, 'DigitalOutput');

    moveArm(u.arm_x_neutral, u.arm_z_neutral, u.arm_grip_neutral);


   
end
