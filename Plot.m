% Rayleigh scattering
% Use SI units

clear;
clc;

x = 0.3:0.01:1.3;
% Index of refraction of the sphere (e.g. 1.5)
n_s = 1.57;
% Index of refraction of the background (e.g. 1.33)
n_b = 1.33;

n_rel = n_s/n_b;

Qs = (32.*x.^4./27).*(n_rel-1).^2;

% Plot the graph
loglog(x, Qs, '--',  'LineWidth', 2);
xlim([0.1 1000]);
ylim([1e-3 10]);
xlabel( 'x = ka' );
ylabel( 'Scattering Efficiency Q_s' );