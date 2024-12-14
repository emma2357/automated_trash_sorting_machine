% select an object from a menu, then run the input number of cycles
function runLabels(nrCyclesPerLabel)
    global u
    
    dateTimeStr = string(datetime('now','Format','yyyy-MM-dd_HH_mm_ss'));
    dirName = "Results\" + dateTimeStr + "\";
    mkdir(dirName);

    counterNr = 0;
    
    while (true)
        toggleVisibleLight(false)
        
        [indx, tf] = listdlg('PromptString', ...
            {'Select an object.', ...
            'Place it in the box.', ...
            'Then press OK.'}, ...
            'ListSize',[350,250], ...
            'ListString',u.listLabels, ...
            'SelectionMode', 'single');

        if (~tf)
            break;
        end

        counterNr = counterNr + 1;
        runCycles(dirName, nrCyclesPerLabel, indx - 1, counterNr);
    end
end