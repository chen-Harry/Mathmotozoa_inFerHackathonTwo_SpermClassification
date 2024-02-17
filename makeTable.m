% makes array for flagellum length and beat period, and types

Flag_len = zeros(216,1);
Period = zeros(216,1);

for i=1:216
    sperm = data{i};
    Flag_len(i) = sperm.flagellum_length;
    Period(i) = sperm.period;

    if sperm.fresh
        Type(i) = "fresh";
    else 
        %if sperm.blebbed
        %    Type(i) = "blebbed";
        %else
            Type(i) = "frozen";
        %end
    end
end

