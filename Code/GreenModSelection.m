function parents = GreenModSelection(expectation)
%   GENERATES INDEX OF PARENTS SELECTED AND PAIRED FOR BREEDING WITH THE 
%   ARRAY'S ROWS THAT WAS EVALUATED BY THE FITNESS FUNCTION THAT RESULTED 
%   IN THE EXPECTATION INPUT 
%
%   [MxN DOUBLE] = GreenModSelection([Mx1 DOUBLE])
%
%   INPUTS:
%       expectation : SCALED RESULT FROM GreenModFitScalingRank.m FUNCTION
%
%   OUTPUTS:
%       parents : INDEX OF SELECTED CHROMOSOMES FOR BREEDING. THE ORIGINAL
%       ROWS ARE INDEXED WITH THIS OUTPUT TO GENERATE A NEW ARRAY OF
%       CHROMOSOMES TO BE PAIRED WITH THE ORIGINAL ROWS OF CHROMOSOMES.
%       IE. IF THE RESULT OF arr(parents) GIVES A VECTOR C IN ROW 1 IT
%       SHOULD BE BRED WITH VECTOR A IN ROW 1 OF THE ORIGINAL ARRAY PASSED
%       INTO THE FITNESS FUNCTION F(X) OR f(X)
%
%   ENGINEERS: JAMES COLLINS & NAMKHA NORSANG
%   PROJECT: ME 6101 GREEN MODULAR DESIGN GROUP PROJECT
%   DATE: NOVEMBER 2017
%   LOCATION: GEORGIA INSTITUTE OF TECHNOLOGY. ALT, GA
%
%   NOTE: THIS FUNCTION IS BASED ON MATLAB'S selectionstocunif.m FUNCTION
%   Copyright 2003-2015 The MathWorks, Inc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
   

assert(length(expectation)>1,['AN ERROR OCCURED: FITNESS/POPULATION',... 
    'SIZE IS TOO SMALL']);
nParents = length(expectation);
wheel = cumsum(expectation)/nParents;
parents = zeros(1,nParents);

% STEPSIZE 
stepSize = 1/nParents;

% POSITION SELECTION
position = rand * stepSize;

lowest = 1; 

% ASSIGNS A PARENT TO EACH POSITION OF THE ROULETTE WHEEL 
for i = 1:nParents 
    for j = lowest:length(wheel) 
        if(position < wheel(j)) 
            parents(i) = j;
            lowest = j;
            break;
        end
    end
    position = position + stepSize; % ITERATE TO NEXT STEP
end
   