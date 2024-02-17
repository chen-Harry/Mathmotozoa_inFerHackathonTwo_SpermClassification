% fits first PCA coefficient for each sample to a sinusoid over time
% each is fitted to the function alpha + beta*cos(kt-phi)
% the parameters k and phi are fitted nonlinearly to the average c1 value
% across the whole data
% alpha and beta are then fitted linearly 

num_frames = size(data{1}.cartesian,1);
num_waveforms = length(data);

Alpha = zeros(num_waveforms,1);
Beta = zeros(num_waveforms,1);

beta0 = [2 5 pi/100 pi/2];
modelfun = @(b,t) b(1) + b(2)*cos(b(3)*t - b(4));

c1 = zeros(num_frames, num_waveforms);

for i=1:num_waveforms
    c1(:,i) = coeff((i-1)*num_frames+1: i*num_frames);
end

% makes average c1 wave
c1_average = mean(c1,2);
t = [1:num_frames].';
c1_average_table = table(t, c1_average);
mdl = fitnlm(c1_average_table, modelfun, beta0);
beta = mdl.Coefficients.Estimate;
K = beta(3);
Phi = beta(4);

X = [ones(num_frames,1) cos(K*t - Phi)];

for i=1:num_waveforms
    Wave = coeff((i-1)*num_frames+1: i*num_frames,1);

    % linear regression to get alpha, beta
    beta = X\Wave;
    Alpha(i) = beta(1);
    Beta(i) = beta(2);
end