function plot_data(x, y, h, fig, sTitle, sXlabel, sYlabel)
    % PLOT_DATA 
    %   plot_data(x, y, h, fig, sTitle, sXlabel, sYlabel)
    % 
    % TODO This function requires several improvements, the plots are
    %      not good enough
    
    xlabel(sXlabel);
    ylabel(sYlabel);
    title(sTitle); 
    
    subplot(2, 1, fig);
    scatter(x, y);

    hold on;
    plot(h);
end
