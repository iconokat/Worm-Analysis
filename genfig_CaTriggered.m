function [] = genfig_CaTriggered(theta, ratio, numpoints)
%This function will plot the zero crossing triggered average of ratio, for
%ten points before and ten points after the crossing. KM 10 Dec 2013. 

[up_cycle_start,~] = upcross2(theta);
[down_cycle_start,~] = downcross2(theta);

for i = 1:length(up_cycle_start);
    cross_ups_theta(i,:) = theta(up_cycle_start(i)-numpoints:up_cycle_start(i) + numpoints);
    cross_ups_ratio(i,:) = ratio(up_cycle_start(i)-numpoints:up_cycle_start(i) + numpoints);
end
for i = 1:length(down_cycle_start);
    cross_downs_theta(i,:) = theta(down_cycle_start(i)-numpoints:down_cycle_start(i) + numpoints);
    cross_downs_ratio(i,:) = ratio(down_cycle_start(i)-numpoints:down_cycle_start(i) + numpoints);
end

avg_ups_theta = nanmean(cross_ups_theta);
avg_ups_ratio = nanmean(cross_ups_ratio);
avg_downs_theta = nanmean(cross_downs_theta);
avg_downs_ratio = nanmean(cross_downs_ratio);

%%plotting
figure;
subplot(2,1,1)
plot(cross_ups_theta');
hold on;
plot(avg_ups_theta, 'k','LineWidth',3); axis tight;
subplot(2,1,2)
plot(cross_ups_ratio');
hold on;
plot(avg_ups_ratio, 'k', 'LineWidth',3); axis tight;

figure;
subplot(2,1,1)
plot(cross_downs_theta');
hold on;
plot(avg_downs_theta, 'k','LineWidth',3); axis tight;
subplot(2,1,2)
plot(cross_downs_ratio');
hold on;
plot(avg_downs_ratio, 'k', 'LineWidth',3); axis tight;

end