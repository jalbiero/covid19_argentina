function main(sCommand, optional_value)
    % MAIN Entry point for Covid19 regression
    %  main(sCommand [, optional_value]) execute the specified string command. 
    %  Valid commands are:
    %     - "plot"
    %     - "mse"
    %     - "predict"

    DATA = load("../data/covid19_argentina.csv");
    dates =      DATA(:, 1);  % TODO Future usage
    days =       DATA(:, 2);  % TODO Maybe this column is redundat
    contagions = DATA(:, 3);
    deaths =     DATA(:, 4);

    h_c = regression(days, contagions, @contagions_model);
    h_d = regression(days, deaths, @deaths_model);
            
    switch (sCommand)
        case "plot"
            plot_data(days, contagions, h_c, 1, "", "", "");
            plot_data(days, deaths, h_d, 2, "1-contagions 2-deaths", "day", "");
            pause
            
        case "mse"
            % Useful for adjusting the models (see polynomial_degree 
            % inside xx_model functions below in this file) 
            printf("Contagions MSE = %f\n", mse(contagions, h_c));
            printf("Deaths MSE     = %f\n", mse(deaths, h_d));
            
        case "predict"
            printf("TODO\n");
          
        otherwise
            printf("Unknown command\n");
    end
end

function X = contagions_model(days)
    % Adjust this degree using the MSE estimator to get the best fit
    % (smaller the MSE, the better)
    polynomial_degree = 3; 

    X = zeros(size(days, 1), polynomial_degree + 1);

    for i = 0:polynomial_degree
       X(:, i + 1) = days .^ i;
    end
end

function X = deaths_model(days)
    % Adjust this degree using the MSE estimator to get the best fit
    % (smaller the MSE, the better)
    polynomial_degree = 4; 
    
    X = zeros(size(days, 1), polynomial_degree + 1);
    
    for i = 0:polynomial_degree
       X(:, i + 1) = days .^ i;
    end
end
