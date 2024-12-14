% -------------------------------------------------------------------
% u - USER SETTINGS
% -------------------------------------------------------------------
function [u] = userSettings()    
    u = struct();
    u.conveyorSpeed    = 0.1;
    u.trayDownPos      = 0.58;

    u.arm_x_neutral    = 0.5;
    u.arm_z_neutral    = 0.5;
    u.arm_grip_neutral = 0.1;

    u.listLabels = [
        "L_WINDOW_PANE", ...
        "L_FLAG", ...
        "L_ARCH", ...
        "L_WHEEL", ...
        "L_TREE", ...
        "L_TRIANGLE_PIECE"
    ];
end