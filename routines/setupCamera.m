% create a camera object and modify settings so that 
% exposure and whitebalance are controlled and always the same.
function c = setupCamera()
    global c
    
    c = struct();
    webcamNr                = length(webcamlist)
    c.cam                   = webcam(webcamNr);
    pause(1.0);
    
    if (webcamNr > 1)
        c.cam.ExposureMode      = 'manual';
        %c.cam.Resolution        = '2592x1944';
        %c.cam.Resolution        = '1920x1080';
        %c.cam.Resolution        = '640x480';
        c.cam.Resolution        = '800x600';
        
        c.cam.WhiteBalanceMode  = 'manual';
        c.cam.WhiteBalance      = 2800;
        %preview(m.cam)c
    end
end 