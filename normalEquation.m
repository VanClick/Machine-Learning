function p = normalEquation(X, y)
  X = [ones(length(X), 1), X];
  p = pinv(X' * X) * X' * y;
endfunction
