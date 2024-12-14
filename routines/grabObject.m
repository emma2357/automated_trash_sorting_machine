% function to align the grasping claw with uv objects in the image
function grabObject()
    img = takeUVImage(true, "", 0);
    S   = findUvObjects(true, img);
    boundingBox = S.BoundingBox;
    
    moveArm(0.5, 0.55, 0);    
    centerX = boundingBox(1) + boundingBox(3)/2;
    centerY = boundingBox(2) + boundingBox(4)/2;

    % move conveyor until X position is in range
    slope = (0 - 0.85) / (1440.5 - 447.5);
    b     = 1.233;

    % move arm over the y position
    slope * centerY + b
    armPos = max(min(slope * centerY + b, 1), 0)
    
    moveArm(armPos, 1.0, 0);

    % TODO: bring arm down and grab object
    
    pause(2);
end