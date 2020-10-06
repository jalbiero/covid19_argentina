function [theta, X] = normal_equation(data, y, modelGetX)
    # NORMAL_EQUATION Calculate the normal equation for regression 
    #   [theta, X] = normal_equation(data, y, modelGetX)
    
    X = modelGetX(data);
    theta = pinv(X' * X) * X' * y;
end

% This type of comment fixes github-linguist language detection for matlab/octave files
