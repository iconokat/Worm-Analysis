function [cycle_start cycle_end] = downcross2(theta)
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
        if signtest <= 0 && theta(i+2) < theta(i-2) % make sure they are downward-going mean crossings
        crosstimes(j) = i; % if so, add to our vector of crosstimes
        j = j+1; %increment crosstimes index

        end
    else %for the portions of theta near the edges
        if signtest <= 0 && theta(i) < theta(i-1);   % make sure theta is decreasing
        crosstimes(j) = i; % if so, add to our vector of crosstimes
        j = j+1; %increment crosstimes index
        end
    end
        
end

%% Finding the distance between consecutive crosstimes
distance = 1:length(crosstimes);
distance(1) = 0;
for k = 2:length(crosstimes);
    distance(k) = crosstimes(k) - crosstimes(k-1);
end

%% Using the distance to identify cycles
long_cycles = find(distance > 100); %This value is hard coded, can be changed
cycle_end = crosstimes(long_cycles);
cycle_start = crosstimes(long_cycles-1);


%% Plotting
% figure(1);
% plot(theta)
% hold on; 
% plot(cycle_start, theta(cycle_start),'m*');
% plot(cycle_end, theta(cycle_end),'c*');
% % waitforbuttonpress;
% hold off;

end

