% fits each first PCA coefficent wave to a sinusoid, with each having their
% own values of K and Phi. Some waves cannot be fitted well. See
% linearAlphaBeta.m for more details

num_frames = size(data{1}.cartesian,1);
num_waveforms = length(data);

Alpha = zeros(num_waveforms,1);
Beta = zeros(num_waveforms,1);
K = zeros(num_waveforms,1);
Phi = zeros(num_waveforms,1);

beta0 = [2 5 pi/100 pi/2];
modelfun = @(b,t) b(1) + b(2)*cos(b(3)*t - b(4));

for i=1:num_waveforms
    t = [1:num_frames].';
    Wave = coeff((i-1)*num_frames+1: i*num_frames,1);
    c1_wave = table(t, Wave);

    mdl = fitnlm(c1_wave, modelfun, beta0);
    beta = mdl.Coefficients.Estimate;
    Alpha(i) = beta(1);
    Beta(i) = beta(2);
    K(i) = beta(3);
    Phi(i) = beta(4);
end

