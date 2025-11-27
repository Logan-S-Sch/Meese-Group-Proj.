
% read population graph of wolf and moose population
wm = readtable('Wolf_vs_Moose.csv');
y = wm.Year;
m = wm.Moose;
w = wm.Wolves;

t = y - y(1); % grabbing the first year of the table and settting t to 0 for log_growth formula


% Wolf logistic growth variables
N0_wolves = w(1); % initial value for wolves column
% disp(N0_wolves)
K_wolves = max(w)*1.5; % highest population for wolves, had to multipy by 1.5 becuase the max value happened 
% to also to be the first value from the file. 
r_wolves = 0.4; 

% Call Logistic Growth function
Nt_wolf = log_growth(t, N0_wolves, r_wolves, K_wolves); 

% Plot Logistic Growth model graph for Wolves
figure;
subplot(2,1,1);
plot(y, w, 'go', DisplayName="Real data");
hold on;
plot(y, Nt_wolf, 'r-', DisplayName="Logistc Model")
title('Wolves Logistic Growth')
xlabel('Years (t)')
ylabel('Wolves Population (Nt)')
legend(Location="best")
hold off;

% Moose logistic growth variables
N0_moose = m(1); % initial value for moose column
K_moose = max(m); % highest population for moose 
r_moose = 0.2;
Nt_moose = log_growth(t, N0_moose, r_moose, K_moose);

% Plot Logistic Growth model graph for Mooose
subplot(2,1,2);
plot(y, m, 'yo', DisplayName="Real Data");
hold on;
plot(y, Nt_moose, 'b-', DisplayName="Logistic Model")
title('Moose Logistic Growth')
xlabel('Years (t)')
ylabel('Moose Population (Nt)')
legend(Location="best")
hold off;



