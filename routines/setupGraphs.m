function g = createGraphs()
    % ------------------------------------------------------------------
    % g - Graphs
    % ------------------------------------------------------------------
    g = struct();
    g.yAxisMin                 = 0;  % 
    g.yAxisMax                 = 10; % 
    
    tiledlayout(2, 1, 'Padding', 'none', 'TileSpacing', 'compact');
    nexttile;
    g.nr_graph = plot([0], [0], '-r');
    grid on;
    xlabel("Time [s]");
    ylabel("Number of Objects D etected");
    
    g.imgFigure = nexttile();
end