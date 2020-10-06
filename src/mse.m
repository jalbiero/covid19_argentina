function val = mse(y, h)
    % MSE Calculate the Mean Squared Error
    %   val = mse(y, h) where h is a vector with predicted values for y vector
    
    m = size(y, 1);
    val = sum((y - h) .^ 2) / m;
end

