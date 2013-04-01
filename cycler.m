function [avgbyworm, allcycles, grandmean, cyclevar] = cycler(theta_matrix, color, var)
% plots and returns the average cycle for a matrix of theta values. theta_matrix
% is in long x short format.  Color is for plotting, should be a
% string. If var = 1, then SEM is plotted. If any other value, std is
% plotted. Assumes one minute, 1800 frame long epochs. 
%
%
%

%Kat McCormick, 15 March 2013. kat.mccormick@gmail.com

long = length(theta_matrix);

num_epochs = long/1800;

things = 0:num_epochs;
frame_nums = things.*1800;


for i = 1:num_epochs;
    A{i} = theta_matrix(frame_nums(i)+1:frame_nums(i+1),:);
    for j=1:size(A{i},2);
        [avgbyworm{i}(:,j), allcycles{i,j}] = cycle_avg(A{i}(:,j));
        grandmean{i} = mean(avgbyworm{i}');
        if var == 1;
            cyclevar{i} = SEM(avgbyworm{i}');
        else
            cyclevar{i} = std(avgbyworm{i}');
        end
    end
end


%% plotting
x = 1:100;

for i = 1:num_epochs;
    hold off;
    subplot(1,num_epochs,i); boundedline(x, grandmean{i},cyclevar{i},color,'alpha', 'transparency', 0.3);
    set(gca,'ylim',[-140 140]);
    grid on;
end
