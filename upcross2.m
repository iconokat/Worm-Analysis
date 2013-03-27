function [crosstimes] = upcross2(theta)


j = 1;


%loop to test for sign change


for i = 2:length(theta)
    signtest = theta(i-1)*theta(i);
    
    if signtest <= 0 && theta(i) > theta(i-1)  % to get only upward-going mean crossings
        crosstimes(j) = i;
        j = j+1;
    end
end