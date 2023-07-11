function [x] = fun_Dp(x, is_on_land, coef_net_G_Sea, coef_net_G_Land, MeanStdP0)
%FUN_DP Summary of this function goes here
%   Detailed explanation goes here
noise = randn;
if is_on_land >= 0.5
%     x = x([1, 2, 6 : 10, 14 : 17]);
%     
    x = [(x - MeanStdP0.MeanLand(1 : end - 1))...
        ./ MeanStdP0.StdLand(1 : end - 1), noise]';
    
    x = coef_net_G_Land.A{1} * x + coef_net_G_Land.b{1}';
    for ilayer = 2 : length(coef_net_G_Land.A)
        x = max(0.25 * x, x);
        x = coef_net_G_Land.A{ilayer} * x + coef_net_G_Land.b{ilayer}';
    end
    
    x = x * MeanStdP0.StdLand(end) + MeanStdP0.MeanLand(end);
else
%     x = x(1 : 15);
    x = [(x - MeanStdP0.MeanSea(1 : end - 1))...
        ./ MeanStdP0.StdSea(1 : end - 1), noise]';
    
    x = coef_net_G_Sea.A{1} * x + coef_net_G_Sea.b{1}';
    for ilayer = 2 : length(coef_net_G_Sea.A)
        x = max(0.25 * x, x);
        x = coef_net_G_Sea.A{ilayer} * x + coef_net_G_Sea.b{ilayer}';
    end
    
    x = x * MeanStdP0.StdSea(end) + MeanStdP0.MeanSea(end);
end
end

