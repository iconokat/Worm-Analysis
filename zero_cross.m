function [crosstimes ups downs] = zero_cross(theta)
% This function identifies downward-going zero crossings for the purpose of
% identifying single head swing cycles. To omit reversals, a length
% criterion is added. Returns two vectors, cycle_start and cycle_end, with
% the theta indexes of the edges of the cycles. 
% Kat McCormick 2013
% significantly modified on June 12, 2013 KM
% again on July 9, 2013

j = 1;
crosstimes = [];
%distance =100;



%% Main loop. 
for i = 2:length(theta)
    signtest = theta(i-1)*theta(i); % test for sign change
    if length(theta)-2 > i && i > 2 % In the middle of the theta string, we can look two back and forward
        if signtest <= 0 % if sign has changed
        crosstimes(j) = i; % if so, add to our vector of crosstimes
        j = j+1; %increment crosstimes index

        end
%     else %for the portions of theta near the edges
%         if signtest <= 0 && theta(i) < theta(i-1);   % make sure theta is decreasing
%         crosstimes(j) = i; % if so, add to our vector of crosstimes
%         j = j+1; %increment crosstimes index
%         end
    end
        
end

% %% Finding the distance between consecutive crosstimes
% distance = 1:length(crosstimes);
% distance(1) = 0;
% for k = 2:length(crosstimes);
%     distance(k) = crosstimes(k) - crosstimes(k-1);
% end

% %% Using the distance to identify cycles
% long_cycles = find(distance > 50); %This value is hard coded, can be changed
% cycle_end = crosstimes(long_cycles);
% cycle_start = crosstimes(long_cycles-1);


% %% Plotting
% figure(1);
% plot(theta)
% hold on; 
% plot(cycle_start, theta(cycle_start),'m*');
% plot(cycle_end, theta(cycle_end),'c*');
% waitforbuttonpress;
% hold off;

m=1;
l = 1;

for k = 1:length(crosstimes)-1
    start = crosstimes(k);
    finish = crosstimes(k+1);
    theta_seg = theta(start:finish);
    theta_seg(end) = 0;  
    if mean(theta_seg) > 0
        ups{m} = theta_seg;
        norm_ups{m} = interpft(theta_seg,100);
        m=m+1;
    else
        downs{l} = theta_seg;
        norm_downs{l} = interpft(theta_seg,100);
        l = l+ 1;
    end
end

theta_seg_lengths = [cellfun('length',ups) cellfun('length', downs)];
x = max(theta_seg_lengths);
ohs = zeros(1,x);

%% plotting
% This part plots in time, no normalization
figure;
hold on;
for k = 1:length(ups);
    plot(ups{k},'m');
end
for k = 1:length(downs);
    plot(downs{k});
end
plot(ohs,'k')
set(gca, 'YTick', [-100:100:100])
set(gca,'xlim', [1 150])
set(gca, 'ylim', [-175 175])
set(gca, 'XTick', [0:60:120])
set(gca, 'XTickLabel', [0 2 4])
set(gcf, 'position', [111   476   304   152])
set(gcf, 'Color', 'w');

%This part plots in normalized cycle length
figure;
hold on;
for k = 1:length(ups);
    plot(norm_ups{k},'m');
end
for k = 1:length(downs);
    plot(norm_downs{k});
end
norm_ohs = zeros(1,100);
plot(norm_ohs,'k')
set(gca, 'YTick', [-100:100:100])
set(gca,'xlim', [1 100])
set(gca, 'ylim', [-175 175])
set(gca, 'XTick', [0 100])
set(gca, 'XTickLabel', [0 .5])
set(gcf, 'position', [111   276   304   152])
set(gcf, 'Color', 'w');
end




