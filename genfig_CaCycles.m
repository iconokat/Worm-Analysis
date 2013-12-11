function [] = genfig_CaCycles(theta, ratio);
% This function is intended to give an idea of what an average theta cycle
% and ratio looks like for a given worm.  Based on cycle_avg. KM 10 December 2013. kat.mccormick@gmail.com

[cycle_start, cycle_end] = upcross2(theta);
norm_cycles = inf(length(cycle_start)-1, 100);

for i= 1:length(cycle_start)
    cyclei = theta(cycle_start(i):cycle_end(i));
    ratioi = ratio(cycle_start(i):cycle_end(i));
    if length(cyclei)>55 %% This is meant to weed out reversals / other blips, but may need adjustment
        norm_cycles(i,:)= interpft(cyclei,100);
        norm_ratios(i,:)= interpft(ratioi, 100);
    end
end
    norm_cycles = norm_cycles(isfinite(norm_cycles(:, 1)), :); %remove NaN,inf rows
    avgcycle = nanmean(norm_cycles,1);
    
    norm_ratios = norm_ratios(isfinite(norm_ratios(:, 1)), :); %remove NaN,inf rows
    avgratio = nanmean(norm_ratios,1);
    
%     %% plotting
%     list = [];
%     figure(2);
%     for i = 1:size(norm_cycles,1);
%         if isfinite(norm_cycles(i,1)); % if the first element is not a NaN...
%         list = [list i];  % add the row number to the list
%         end
%     end
%     numb = numel(list);  %how many real cycles are there?
%     m = 3;
%     n = ceil(numb/m);
%     for p = 1:numb
%         subplot(m,n,p);
%         plot(norm_cycles((list(p)),:));
%     end
 


    
    
%% plotting
figure(1)
subplot(2,1,1)
plot(norm_cycles');
hold on;
figure(1)
plot(avgcycle,'k','LineWidth',5);

subplot(2,1,2)
plot(norm_ratios');
hold on;
plot(avgratio,'k','LineWidth',5);


end