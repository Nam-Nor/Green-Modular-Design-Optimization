function children  = GreenModCrossoverScattered(parents,mateIndex)
%   EXECUTES A POSITION INDEPENDENT CROSSOVER OF CHROMOSOME ELEMENTS 
%   M ROWS OF DESIGN CHROMOSOMES ARE MATCHED FOR CROSSOVER BY A SELECTION
%   INDEX FROM THE GreenModSelection.m FUNCTION
%
%   [MxN DOUBLE] = GreenModCrossoverScattered([MxN DOUBLE],[Mx1 DOUBLE])
%
%   INPUTS:
%       parents : ARRAY CONSISTING OF M DESIGN CHROMOSOME VECTORS FOR N
%                 DESIGN COMPONENTS
%       mateIndex :      VECTOR IDENTIFYING THE ROWS IN THE PARENT ARRAY 
%                        TO BE BRED WITH THE MATCHING ROW IN THE ARRAY 
%                        WHERE THE VECTOR'S ELEMENT IS POSITIONED. 
%                        IE. A FIRST ELEMENT IN selectionIndex of 3 MEANS
%                        THAT THE THIRD ROW IN parents IS TO BE MATED WITH
%                        THE FIRST ROW IN parents TO PRODUCE THE FIRST ROW
%                        OF THE CHILDREN OUTPUT ARRAY
%
%   OUTPUTS:
%       children : NEW CHROMOSOME ARRAY AFTER CROSSOVER COMPLETION 
%
%   ENGINEERS: JAMES COLLINS & NAMKHA NORSANG
%   PROJECT: ME 6101 GREEN MODULAR DESIGN GROUP PROJECT
%   DATE: NOVEMBER 2017
%   LOCATION: GEORGIA INSTITUTE OF TECHNOLOGY. ATL, GA
%
%   NOTE: THIS FUNCTION IS BASED ON MATLAB'S crossoverScattered.m FUNCTION
%   Copyright 2003-2015 The MathWorks, Inc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DETERMINE SIZE OF CHROMOSOME VECTORS AND NUMBER IN POPULATION
[nchildren,GenomeLength] = size(parents); 
% ERROR IF THERE ARE AN ODD NUMBER OF CHILDREN/PARENTS - THE APPLIED
% ALGORITHM ASSUMES A CONSTANT POPULATION
assert(mod(nchildren,2)==0,'AN EVEN NUMBER OF PARENTS MUST BE SELECTED');
% INITALIZE CHILDREN OUTPUT ARRAY
children = zeros(nchildren,GenomeLength);
% INITALIZED NEW ARRAY TO MATCH TO PARENT ARRAY FOR MATING 
mateArray = parents(mateIndex,:);
% INITIALIZE INDEX
index = 1;
for i=1:nchildren/2
    % PAIR THE PARENTS
    r1 = parents(index,:);
    index = index+1;
    r2 = mateArray(index,:);
    % SELECT 1/2 THE GENES FROM EACH PARENT TO SWAP
    for j = 1:GenomeLength
        if(rand > 0.5)
            children(index-1,j) = r1(j);
            children(index,j) = r2(j);
        else
            children(index-1,j) = r2(j);
            children(index,j) = r1(j);
        end
    end
    index = index + 1;
end
end
