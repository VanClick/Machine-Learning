function [X, y] = calcXY(data)
  A = data(:,1);
  B = data(:,2);
  C = data(:,3);
  
  y = (C - B) ./ B;
  X = [B, (B - A) ./ A];
  
endfunction
