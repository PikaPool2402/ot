clc;
clear all;

a = [2 3 -1 4; 1 -2 6 -7];
b = [8; -3];
c = [2 3 4 7];

n = size(a, 2);
m = size(a, 1);

if n > m
    nv = nchoosek(n, m);
    t = nchoosek(1:n, m);
    sol = [];
    for i = 1: nv
        x = a(:, t(i, :))\b;
        y = zeros(n, 1);
    
        if all(x >= 0 & x ~= inf & x ~= -inf)
            y(t(i, :), :) = x;
            sol = [sol y];
        end
    end
end

z = c*sol;
[zmax, zind] = max(z);

bfs = sol(:, zind);

optval = [bfs' zmax];
array2table(optval, 'VariableNames', {'x1', 'x2', 'x3', 'x4', 'z'})