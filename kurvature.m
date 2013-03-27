function [kurv, arcl] = kurvature(theta);

%Using the law of cosines to determine the tangent angle between
%consecutive point. References:
%http://mathworld.wolfram.com/LawofCosines.html
%The Shallow turn of a worm, Kim et al., 2011

kurv = zeros(size(theta-2));
dtan = zeros(size(theta));
arcl = zeros(size(theta));
segl = zeros(size(theta-2));
angle = zeros(size(theta));


for k = 1:length(theta)-2;
    segl(k) = sqrt(1^2 + (theta(k+1)-theta(k))^2); %segment length between two consecutive points
    seglb = sqrt(1^2+(theta(k+2)-theta(k+1))^2); %segment length of side "b" of triangle for law of cosines
    seglc = sqrt(2^2+(theta(k+2)-theta(k))^2); % segment length of hypotenuse "c"
    angle(k) = acos((segl(k)^2 + seglb^2 - seglc^2)/(2*segl(k)*seglb));
    dtan(k) = 180-angle(k);
    arcl(k) = sum(segl(1:k));
    kurv(k) = dtan(k)/segl(k); %should really be k-1, i think. 
end

    figure; 
    plot(arcl,kurv);
    
    
    
%     v1 = [k-(k+1);theta(k)-theta(k+1)];
%     v2 = [(k+2)-(k+1);theta(k+2)-theta(k+1)];
%     angle = acos(dot(v2,v1)/(norm(v1)*norm(v2)))*180/pi;