% This function is intended to give an idea of what an average theta cycle
% looks like for a given worm. KM 11 March 2013. kat.mccormick@gmail.com


function [avgcycle, norm_cycles] = cycle_avg(theta)

times = upcross2(theta);
norm_cycles = inf(length(times)-1, 500);

for i= 1:length(times)-1
    cyclei = theta(times(i):times(i+1),1);
<<<<<<< HEAD
    if length(cyclei)>55 %% This is meant to weed out reversals / other blips, but may need adjustment
        norm_cycles(i,:)= interpft(cyclei,500);
    end
end
    avgcycle = nanmean(norm_cycles);
    
    %% plotting
    list = [];
    figure;
    for i = 1:size(norm_cycles,1);
        if isfinite(norm_cycles(i,1)); % if the first element is not a NaN...
        list = [list i];  % add the row number to the list
        end
    end
    numb = numel(list);  %how many real cycles are there?
    m = 3;
    n = ceil(numb/m);
    for p = 1:numb
        subplot(m,n,p);
        plot(norm_cycles((list(p)),:));
    end
=======
    if length(cyclei)>100 %% This is meant to weed out reversals / other blips, but may need adjustment
        norm_cycles(i,:)= interpft(cyclei,100); % interpolate to length 100
    end
end
    avgcycle = nanmean(norm_cycles);
    norm_cycles = norm_cycles(isfinite(norm_cycles(:, 1)), :); %remove NaN rows
    
%% plotting
plot(norm_cycles');
hold on;
plot(avgcycle,'k','LineWidth',3);
waitforbuttonpress;
hold off;


  
>>>>>>> Added Plotting for cycles
