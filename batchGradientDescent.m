% X: features
% y: target 
% alpha: leaning rate
% count: repeat count
function [R param] = batchGradientDescent(X, y, alpha, count)
  m = size(X, 1);  % number of training exammples
    
  meanX = mean(X);  % mean
  stdX = std(X);   % standard deviation
  U = (X - meanX) ./ stdX;
  U1 = [ones(m, 1), U];
  
  p = ones(size(U1, 2), 1); % parameters
  Params = zeros(count, length(p));
  costs = zeros(count, 1);     
  for i = 1:count
    omega = 1 / m * (U1' * (U1 * p - y));  % derivative
    p = p - alpha * omega;
    Params(i,:) = p';
    costs(i, 1) = sum((U1 * p - y) .^ 2) / (2 * m);  % cost function
  end
  
  R = [Params costs];
  
  p1 = Params(size(Params,1), :);
  p2 = p1(2 : length(p1));
  p3 = p2 ./ stdX;
  p4 = p1(1) - meanX * p3';
  param = [p4, p3];
endfunction