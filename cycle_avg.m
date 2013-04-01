% This function is intended to give an idea of what an average theta cycle
% looks like for a given worm. KM 11 March 2013. kat.mccormick@gmail.com


function [avgcycle, norm_cycles] = cycle_avg(theta)

times = upcross2(theta);
norm_cycles = NaN(length(times)-1, 100);

for i= 1:length(times)-1
    cyclei = theta(times(i):times(i+1),1);
    if length(cyclei)>35 %% This is meant to weed out reversals / other blips, but may need adjustment
        norm_cycles(i,:)= interpft(cyclei,100);
    end
end
    avgcycle = nanmean(norm_cycles);