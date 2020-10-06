function h = regression(days, y, model)
    # REGRESSION Calculates regression based on 'model'
    #   h = regression(days, y, model)
    
    [theta, X] = normal_equation(days, y, model);
    h = X * theta; 
end

% This type of comment fixes github-linguist language detection for matlab/octave files
