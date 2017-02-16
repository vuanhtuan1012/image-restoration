function displayHist(H)
% function displayHist is to plot histogram H

bar(0:255,H,'m');
axis([0 256 0 floor(1.05*max(H(:)))]); % limit x-, y- range