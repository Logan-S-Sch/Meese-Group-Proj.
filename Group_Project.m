year = 1985:2000;
Wolf = [22 20 16 12 11 15 12 12 13 15 16 22 24 14 25 29];
Moose = [1062 1025 1380 1653 1397 1216 1313 1600 1880 1800 2400 1200 500 700 750 850];

% Fit polynomial (3rd-degree example)
p_Wolf = polyfit(year, Wolf, 3);
p_y = polyfit(year, Moose, 3);

% Generate smooth curve
year_fit = linspace(1985, 2000, 200);
x_fit = polyval(p_Wolf, year_fit);
y_fit = polyval(p_y, year_fit);

% Plot
figure;
subplot(2,1,1);
plot(year, Wolf, 'ro', year_fit, x_fit, 'r-');
title('Wolves per Year');
xlabel('Year'); ylabel('Wolves');

subplot(2,1,2);
plot(year, Moose, 'bo', year_fit, y_fit, 'b-');
title('Moose per Year');

xlabel('Year'); ylabel('Moose');
