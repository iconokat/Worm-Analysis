figure;
subplot(2,1,1)
plot(ratio)
set(gca, 'xlim', [1 length(ratio)])
subplot(2,1,2)
plot(yfp,'y')
hold on;
plot(cfp,'c')
set(gca, 'xlim', [1 length(ratio)])