% makes array for flagellum length and beat period, and types

Flag_len = zeros(216,1);
Period = zeros(216,1);

for i=1:216
    sperm = data{i};
    Flag_len(i) = sperm.flagellum_length;
    Period(i) = sperm.period;

    if sperm.fresh
        Type(i) = "fresh";
        Type_blebbed(i) = "fresh";
    else 
        Type(i) = "frozen";
        if sperm.blebbed
            Type_blebbed(i) = "blebbed";
        else
            Type_blebbed(i) = "frozen";
        end
    end
end

if size(Type,1) == 1
    Type = Type.';
end

if size(Type_blebbed,1) == 1
    Type_blebbed = Type_blebbed.';
end
