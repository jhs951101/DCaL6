function Y = Rayleigh_Value(r, sigma2)

[startPoint, endPoint] = size(r);
Y = startPoint : 1 : endPoint;

i = 1;
while i <= endPoint
    if r(1,i) < 0
        Y(1,i) = 0;
    else
        Y(1,i) = r(1,i) * exp(-1 * r(1,i)^2 / (2 * sigma2)) / sigma2;
    end
    
    i = i+1;
end