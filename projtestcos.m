year = 1985:2000;
Wolf = [22 20 16 12 11 15 12 12 13 15 16 22 24 14 25 29];
Moose = [1062 1025 1380 1653 1397 1216 1313 1600 1880 1800 2400 1200 500 700 750 850];

% Fit polynomial for wolves
p_Wolf = polyfit(year, Wolf, 3);

% Generate smooth x-axis
year_fit = linspace(1985, 2000, 200);


Amp_W = 2.1;
Omega_W = 1.2;
phi_W = pi / 2;
initial_val_W = 22; 
x = (year_fit - 1985);
Wolf_fit = Amp_W*sin(Omega_W* x + phi_W) - (20/33) * x + initial_val_W;


Amp_W = 2.1;
Omega_W = 1.2;
phi_W = pi / 2;
initial_val_W = 22;

% Evaluate model at actual year points:
x_data = year - 1985;
Wolf_model_at_data = Amp_W .* sin(Omega_W .* x_data + phi_W) - (20/33).*x_data + initial_val_W;


Amp_M = -390;
initial_val_M = 1300;
x_data = year - 1985;
Moose_model_at_data = Amp_M .* cos(x_data) + initial_val_M;


%% Moose cosine curve
Amp_M = -390;
initial_val_M = 1300;
% Scale years so cosine makes one smooth oscillation across 1985–2000
x = (year_fit - 1985);   % maps 1985→0, 2000→π
Moose_fit = Amp_M .* cos(x) + initial_val_M;

%% Matrics
MSE_W = immse(Wolf , Wolf_model_at_data)
MSE_M = immse(Moose , Moose_model_at_data)

disp(['Wolf MSE = ', num2str(MSE_W)]);
disp(['Moose MSE = ', num2str(MSE_M)]);

% --- Plot results ---
figure;

% Wolves (polynomial)
subplot(2,1,1);
plot(year, Wolf, 'ro', 'MarkerFaceColor', 'r'); hold on;
plot(year_fit, Wolf_fit, 'r-');
title('Wolves per Year (3rd-Degree Polynomial Fit)');
xlabel('Year'); ylabel('Wolves');
grid on;

% Moose (cosine model)
subplot(2,1,2);
plot(year, Moose, 'bo', 'MarkerFaceColor', 'b'); hold on;
plot(year_fit, Moose_fit, 'b-');
title('Moose per Year (Cosine Model: y = -1000cos(x) + 1500)');
xlabel('Year'); ylabel('Moose');
grid on;