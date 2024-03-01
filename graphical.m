clc;
clear all;

a = [1 1; 2 1; 1 0; 0 1];
b = [40; 60; 0; 0];
c = [8 1];

x1 = 0: 1: max(b);
x21 = (b(1) - a(1,1) * x1)/a(1,2);
x22 = (b(2) - a(2,1) * x1)/a(2,2);

x21 = max(0, x21);
x22 = max(0, x22);

plot(x1, x21, 'r', x1, x22, 'b');
xlabel("value of x1");
ylabel("value of x2");
title("x1 v/s x2");

pt = [];
for i = 1: size(a, 1)
    a1 = a(i, :);
    b1 = b(i, :);
    for j = i+1: size(a, 1)
        a2 = a(j, :);
        b2 = b(j, :);
        aa = [a1; a2];
        bb = [b1; b2];

        x = aa\bb;
        pt = [pt x];
    end
end
pt = pt';

for i = 1: size(pt, 1)
    const1(i) = a(1,1)*pt(i,1) + a(1,2)*pt(i,2) - b(1);
    const2(i) = a(2,1)*pt(i,1) + a(2,2)*pt(i,2) - b(2);
end

s1 = find(const1 > 0);
s2 = find(const2 > 0);
s = unique([s1, s2]);
pt(s, :) = [];

s3 = find(pt(:, 1) < 0);
pt(s3, :) = [];
s4 = find(pt(:, 2) < 0);
pt(s4, :) = [];

z = pt*(c');
[zmax zind] = max(z);
x1 = pt(zind, 1);
x2 = pt(zind, 2);