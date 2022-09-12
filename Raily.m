% Rayleigh scattering
% Use SI units

clear;
clc;

% Diameter of the sphere (e.g. 20 nm)
diameter_SI = 20;
% Wavelength of the light (e.g. 500 nm)
lambda_SI = 400;
% Index of refraction of the sphere (e.g. 1.5)
n_s = 1.57;
% Index of refraction of the background (e.g. 1.33)
n_b = 1.33;
% Specific weight of sphere (e.g. 1.05 g/cm^3)
rho_s = 1.05;
% Specific weight of background (e.g. 1.0 g/cm^3)
rho_b = 1.0;
% Concentration of spheres in background by weight (e.g. 1e-5 g/g)
C_wt = 1e-5;

% Resort Unit
diameter = diameter_SI*1e-9;
radius = diameter / 2;
lambda = lambda_SI*1e-9;

% Calculate Intermediate Parameters
k = 2*pi*n_b/lambda;
x = k*radius;
n_rel = n_s/n_b;

Qs = 8*x^4/3*abs((n_rel^2-1)/(n_rel^2+2))^2;
sigma_s = Qs*pi*radius^2;

vol_sphere = 4*pi/3*radius^3;
N_s = C_wt*rho_b/vol_sphere/rho_s;
mu_s = N_s*sigma_s;

fprintf('Propagation constant in background medium = %g m^-1\n', k);
fprintf('Relative refractive index = %g\n', n_rel);
fprintf('Size parameter = %g\n', x);
fprintf('Scattering cross section = %g m^2\n', sigma_s);
fprintf('Scattering efficiency = %g\n', Qs);
fprintf('Scattering coefficient = %g m^-1\n', mu_s);