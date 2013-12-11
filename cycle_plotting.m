function cycle_plotting(num_epochs, grandmean, cyclevar, color)
%%plots the mean cycle for each epoch with a fuzzy line representing the
%%variance. Can be plotted atop one another. 

x = 1:100;

for i = 1:num_epochs;
    hold off;
    subplot(1,num_epochs,i); boundedline(x, grandmean{i},cyclevar{i},color,'alpha', 'transparency', 0.3);
    set(gca,'ylim',[-140 140]);
    grid on;
end
set(gcf, 'position', [10 244 859 477])