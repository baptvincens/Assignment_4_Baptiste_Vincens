%% Function computeDisplacementsUncertainty
% This functions computes and plots the standard deviation and average
% value of the noise obtained with digital image correlation when doing a
% "Zero Displacement Test" (ZDT)

function [Std_u, Std_v, Std_w, Avg_u, Avg_v, Avg_w] = computeDisplacementsUncertainty(filenames, nb_subset, pixel_size)

x = [];  % initialisation of variables
y = [];
z = [];
u = [];
v = [];
w = [];
exx = [];
eyy = [];
exy = [];
e1 = [];
e2 = [];
gamma = [];

for i = 1:length(filenames)
    D = importdata(filenames(i)); % fills data vectors with the data obtained from several images
    
    x = [x; D.data(:, 1)];
    y = [y; D.data(:, 2)];
    z = [z; D.data(:, 3)];
    u = [u; D.data(:, 4)];
    v = [v; D.data(:, 5)];
    w = [w; D.data(:, 6)];
    exx = [exx; D.data(:, 7)];
    eyy = [eyy; D.data(:, 8)];
    exy = [exy; D.data(:, 9)];
    e1 = [e1; D.data(:, 10)];
    e2 = [e2; D.data(:, 11)];
    gamma = [gamma; D.data(:, 12)];
end

x_min = min(x); % determines the limits of the data
x_max = max(x);
y_min = min(y);
y_max = max(y);

x_index = linspace(x_min, x_max, nb_subset+1); % determines the breakdown of the field of vision into sub-areas
y_index = linspace(y_max, y_min, nb_subset+1);

Std_u = zeros(nb_subset, nb_subset); % initialization of matrices with results
Std_v = Std_u;
Std_w = Std_u;
Avg_u = Std_u;
Avg_v = Std_u;
Avg_w = Std_u;

for i = 1 : nb_subset
    for j = 1 : nb_subset % fill matrices with standard deviation or average of values inside each sub-area
        
        Std_u(i, j) = std(u(x<=x_index(i+1) & x>x_index(i) & y>=y_index(j+1) & y<y_index(j)))/pixel_size;
        Avg_u(i, j) = mean(u(x<=x_index(i+1) & x>x_index(i) & y>=y_index(j+1) & y<y_index(j)))/pixel_size;
        
        Std_v(i, j) = std(v(x<=x_index(i+1) & x>x_index(i) & y>=y_index(j+1) & y<y_index(j)))/pixel_size;
        Avg_v(i, j) = mean(v(x<=x_index(i+1) & x>x_index(i) & y>=y_index(j+1) & y<y_index(j)))/pixel_size;
        
        Std_w(i, j) = std(w(x<=x_index(i+1) & x>x_index(i) & y>=y_index(j+1) & y<y_index(j)))/pixel_size;
        Avg_w(i, j) = mean(w(x<=x_index(i+1) & x>x_index(i) & y>=y_index(j+1) & y<y_index(j)))/pixel_size;
        
    end
end

%% Plots

f = figure;
f.Position = [100 100 800 800];

tiledlayout(3, 2);

nexttile;

imagesc(Std_u, 'XData', [x_min, x_max], 'YData', [y_min, y_max]); 
title('Standard deviation of U in ZDT');
xlabel('X [mm]'); ylabel('Y [mm]');
c = colorbar('eastoutside');
caxis([min([min(Std_u, [], 'all'), min(Std_v, [], 'all'), min(Std_w, [], 'all')]), max([max(Std_u, [], 'all'), max(Std_v, [], 'all'), max(Std_w, [], 'all')])]);
c.Label.String = '\fontsize{10} \sigma_U [px]';
axis square;
colormap(flipud(gray));

nexttile;

imagesc(Avg_u, 'XData', [x_min, x_max], 'YData', [y_min, y_max]); 
title('Average value of U in ZDT');
xlabel('X [mm]'); ylabel('Y [mm]');
c = colorbar('eastoutside');
caxis([min([min(Avg_u, [], 'all'), min(Avg_v, [], 'all'), min(Avg_w, [], 'all')]), max([max(Avg_u, [], 'all'), max(Avg_v, [], 'all'), max(Avg_w, [], 'all')])]);
c.Label.String = '\mu_U [px]';
axis square;
colormap(flipud(gray)); 

nexttile;

imagesc(Std_v, 'XData', [x_min, x_max], 'YData', [y_min, y_max]); 
title('Standard deviation of V in ZDT');
xlabel('X [mm]'); ylabel('Y [mm]');
c = colorbar('eastoutside');
caxis([min([min(Std_u, [], 'all'), min(Std_v, [], 'all'), min(Std_w, [], 'all')]), max([max(Std_u, [], 'all'), max(Std_v, [], 'all'), max(Std_w, [], 'all')])]);
c.Label.String = '\sigma_V [px]';
axis square;
colormap(flipud(gray)); 

nexttile;

imagesc(Avg_v, 'XData', [x_min, x_max], 'YData', [y_min, y_max]); 
title('Average value of V in ZDT');
xlabel('X [mm]'); ylabel('Y [mm]');
c = colorbar('eastoutside');
caxis([min([min(Avg_u, [], 'all'), min(Avg_v, [], 'all'), min(Avg_w, [], 'all')]), max([max(Avg_u, [], 'all'), max(Avg_v, [], 'all'), max(Avg_w, [], 'all')])]);
c.Label.String = '\mu_V [px]';
axis square;
colormap(flipud(gray)); 

nexttile;

imagesc(Std_w, 'XData', [x_min, x_max], 'YData', [y_min, y_max]); 
title('Standard deviation of W in ZDT');
xlabel('X [mm]'); ylabel('Y [mm]');
c = colorbar('eastoutside');
caxis([min([min(Std_u, [], 'all'), min(Std_v, [], 'all'), min(Std_w, [], 'all')]), max([max(Std_u, [], 'all'), max(Std_v, [], 'all'), max(Std_w, [], 'all')])]);
c.Label.String = '\sigma_W [px]';
axis square;
colormap(flipud(gray)); 

nexttile;

imagesc(Avg_w, 'XData', [x_min, x_max], 'YData', [y_min, y_max]); 
title('Average value of W in ZDT');
xlabel('X [mm]'); ylabel('Y [mm]');
c = colorbar('eastoutside');
caxis([min([min(Avg_u, [], 'all'), min(Avg_v, [], 'all'), min(Avg_w, [], 'all')]), max([max(Avg_u, [], 'all'), max(Avg_v, [], 'all'), max(Avg_w, [], 'all')])]);
c.Label.String = '\mu_W [px]';
axis square;
colormap(flipud(gray)); 

end
