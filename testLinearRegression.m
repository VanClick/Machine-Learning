function [R p p1] = testLinearRegression()
  m = 10000000;
  x1 = rand(m, 1) * 74;
  x2 = rand(m, 1) * 20 - 10;
  x3 = rand(m, 1) * 3 + 10;
  x4 = rand(m, 1) * 100 - 2000;
  x5 = rand(m, 1) * 0.4 + 2;
  x6 = rand(m, 1) * 0.03 + 0.01;
  X = [x1, x2, x3, x4, x5, x6];
  y = 3 * x1 - 5 * x2 + 60 * x3 +  0.1 * x4 + 10 * x5 + 100 * x6 + 20;
  y = y + randn(m, 1) * 100;
  
  [R p] = batchGradientDescent(X, y, 1, 5);
  p
  p1 = normalEquation(X, y);
  p1'
endfunction
