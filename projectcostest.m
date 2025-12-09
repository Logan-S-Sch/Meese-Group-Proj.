% This section reads excel file containing the information for the
% population of Wolves and Moose over the years. 
wm = readtable('Wolf_vs_Moose.csv');
Years = wm.Year;
Moose = wm.Moose;
Wolf = wm.Wolves;

% Sets the variable time to start at 1,2,3,....
time = Years - Years(1);

% This section Creates variables that fine tune the Cosine formula and 
% plots the graph for wolves
Amp_W = 11; % Amplitude
Per_W = 23; % Period
Phase_W = 0.17; % phase shift
Vertical_W = 19; % vertical shift
%^x(t) = A*cos(wt + theta) + vertical shift)
% w = 2pi/T = Period
Wolf_fit = Amp_W * cos((2*pi/Per_W) * time + Phase_W) + Vertical_W;

% This section Creates variables that fine tune the Cosine formula for the
% and plots the graph for Moose population
Amp_M = 600; % Amplitude
Per_M = 28; % Period
Phase_M = 10; % phase shift
Vertical_M = 1065; % vertical shift
%^x(t) = A*cos(wt + theta) + vertical shift)
% w = 2pi/T = Period
Moose_fit = Amp_M * cos((2*pi / Per_M) * time + Phase_M) + Vertical_M;


%% MSE function
% Calculate Mean Squared Error for both models and displays them
MSE_W = immse(Wolf, Wolf_fit);
MSE_M = immse(Moose, Moose_fit);

fprintf('\n-----------------------------\n')
fprintf('Wolf MSE = %.3f\n', MSE_W)
fprintf('Moose MSE = %.3f\n', MSE_M)
fprintf('-----------------------------\n')

% --- Plot results ---
figure;

% Wolves (Cosine Model)
subplot(2,1,1);
plot(Years, Wolf, 'ro', 'MarkerFaceColor', 'r', DisplayName='Actual Data');
hold on;
plot(Years, Wolf_fit, 'y-', LineWidth=2, DisplayName='Tuned Model');
title('Wolves per Year(Cosine: x(t) = A*cos(wt + theta) + vertical shift)');
xlabel('Years'); ylabel('Wolves');
legend(Location="best")
grid on;

% Moose (Cosine model)
subplot(2,1,2);
plot(Years, Moose, 'bo', 'MarkerFaceColor', 'b', DisplayName='Actual Data'); 
hold on;
plot(Years, Moose_fit, 'g-', LineWidth=2, DisplayName='Tuned Model');
title('Moose per Year(Cosine: x(t) = A*cos(wt + theta) + vertical shift)');
xlabel('Years'); ylabel('Moose');
legend(Location="best")
grid on;