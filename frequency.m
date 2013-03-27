function [matrix arrayname] = frequency(arrayname)

matrix = zeros((length(arrayname)-1),5);

for i= 2:length(arrayname)
    corrected = arrayname{i,6};
    [crosstimes] = upcross(corrected);
    arrayname{i,10} = crosstimes;
    matrix(i-1,1) = length(find(crosstimes<1801));
    matrix(i-1,2) = length(find(crosstimes<3601 & crosstimes>=1800));
    matrix(i-1,3) = length(find(crosstimes<5401 & crosstimes>=3600));
    matrix(i-1,4) = length(find(crosstimes<7201 & crosstimes>=5400));
    matrix(i-1,5) = length(find(crosstimes<9001 & crosstimes>=7200));
end

