function expectation = GreenModFitScalingRank(scores)
%   RANK BASED FITNESS SCALING. SCALES THE Mx1 SCORES FROM THE F(X) AND 
%   f(X) FITNESS FUNCTION TO READABLE A READABLE FORMAT FOR THE SELECTION
%   FUNCTION GreenModSelection.m.
% 
%   [Mx1 DOUBLE] = GreenModFitScalingRank([Mx1 DOUBLE],
%
%   INPUTS:
%       scores : VECTOR OF NUMBERS CORRESPONDING TO THE RESULTS OF EACH
%       CHROMOSOME (ROW) EVALUATED BY THE FITNESS FUNCTIONS F(X) OR f(X)
%
%   OUTPUTS:
%       expectation : VECTOR OF SCALED RESULTS TO THEN BE INPUT INTO THE
%       SELECTION FUNCTION GreenModSelection.m
%
%   NOTE: IT IS ASSUMED THAT THE SCORES ARE MEANT TO BE MAXIMIZED FOR
%   FUTURE GENERATIONS - IE, ASCENDING SCORES CORRESPOND TO ASCENDING
%   LEVELS OF FITNESS. 
%
%   ENGINEERS: JAMES COLLINS & NAMKHA NORSANG
%   PROJECT: ME 6101 GREEN MODULAR DESIGN GROUP PROJECT
%   DATE: NOVEMBER 2017
%   LOCATION: GEORGIA INSTITUTE OF TECHNOLOGY. ALT, GA
%
%   NOTE: THIS FUNCTION IS BASED ON MATLAB'S fitScalingrank.m FUNCTION
%   Copyright 2003-2015 The MathWorks, Inc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
   

[nParents,~] = size(scores);
scores = scores(:);
[~,i] = sort(scores);

expectation = zeros(size(scores));
expectation(i) = 1 ./ ((1:length(scores)) .^ 0.5);

expectation = nParents * expectation ./ sum(expectation);
