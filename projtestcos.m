year = 1985:2000;
Wolf = [22 20 16 12 11 15 12 12 13 15 16 22 24 14 25 29];
Moose = [1062 1025 1380 1653 1397 1216 1313 1600 1880 1800 2400 1200 500 700 750 850];

% Fit polynomial for wolves
p_Wolf = polyfit(year, Wolf, 3);

% Generate smooth x-axis
year_fit = linspace(1985, 2000, 200);

% Wolf fitted curve (cubic)
Wolf_fit = polyval(p_Wolf, year_fit);

% Moose cosine curve
% Scale years so cosine makes one smooth oscillation across 1985–2000
x = (year_fit - 1985)    % maps 1985→0, 2000→π
Moose_fit = -625 * cos(x) + 1500;

% --- Plot results ---
figure;

% Wolves (polynomial)
subplot(2,1,1);
plot(year, Wolf, 'ro', 'MarkerFaceColor', 'r'); hold on;
plot(year_fit, Wolf_fit, 'r-', 'LineWidth', 1.5);
title('Wolves per Year (3rd-Degree Polynomial Fit)');
xlabel('Year'); ylabel('Wolves');
grid on;

% Moose (cosine model)
subplot(2,1,2);
plot(year, Moose, 'bo', 'MarkerFaceColor', 'b'); hold on;
plot(year_fit, Moose_fit, 'b-', 'LineWidth', 1.5);
title('Moose per Year (Cosine Model: y = -1000cos(x) + 1500)');
xlabel('Year'); ylabel('Moose');
grid on;