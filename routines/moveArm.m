% move the grasping claw to a given location and open / close the claw.
function moveArm(x, z, grip)
    global m

    writePosition(m.arm_x, x);
    writePosition(m.arm_z, z);
    writePosition(m.arm_grip, grip);
end