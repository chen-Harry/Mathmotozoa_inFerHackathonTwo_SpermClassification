function plotAccuracyFreshFrozenBlebbed
    y = [47/56   43/56; 31/73   55/73; 11/23   5/23];
    str={'Fresh'; 'Frozen'; 'Blebbed'};
    labels= {'RUSBoosted', 'Bagged'; 'RUSBoosted', 'Bagged';'RUSBoosted', 'Bagged'};
    

    hB=bar(y);          % use a meaningful variable for a handle array...
    hAx=gca;            % get a variable for the current axes handle
    hAx.XTickLabel=str; % label the ticks
    hT=[];              % placeholder for text object handles
    for i=1:length(hB)  % iterate over number of bar objects
    hT=[hT,text(hB(i).XData+hB(i).XOffset,hB(i).YData,labels(:,i), ...
          'VerticalAlignment','bottom','horizontalalign','center')];
    end

    xlabel("Type")
    ylabel("Accuracy");
    title("Comparison of Accuracy of RUSBoosted and Bagged Trees");
end