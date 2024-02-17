MDC = zeros(num_waveforms, 1);

for i=1:num_waveforms
    distal_tangent_angle = data{i}.tangent_angle(:,900:1000);
    sperm_curvature = 0;
    for t=1:num_frames
        curvature = abs(gradient(distal_tangent_angle(t, :)));
        sperm_curvature = max([curvature sperm_curvature]);
    end

    MDC(i) = sperm_curvature;
end