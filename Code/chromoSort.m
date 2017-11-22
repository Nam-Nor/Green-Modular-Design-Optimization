function [newChromeVec,m] = chromoSort(ChromeVec) 
% CHROMOSOME OUTPUT FORMATTER FOR OUTPUT OF GENETIC ALGORITHM 
% THE FUNCTION IS USED IN THE FALL 2017 ME 6101 FINAL GROUP PROJECT ON
% GREEN MODULAR DESIGN OPTIMIZATION
%
% INPUT: [1XN DOUBLE] CHROMOSOME OUTPUT FROM GA 
%                     EACH INDICE IN THE VECTOR IS A GENE INDICATING THE
%                     NUMBER OF MODULES TO BE GROUPED. THE INDEX OF THE
%                     GENE POSITION INDICATES THE NUMBER OF COMPONENTS IN
%                     THE MODULE
% OUTPUT: [MxN DOUBLE]  REFORMATTED LOGICAL ARRAY BRAKING THE NUMBER OF 
%                       MODULES TO BE GROUPED INTO DIFFERENT ROWS. THE TRUE
%                       INDICES MARK THE POSITIONS WHERE THE MODULE NUMBERS
%                       ARE PRESENT - IE THE NUMBER OF COMPONENTS IN THE
%                       MODULES 
%         [1x1 DOUBLE]  THE MAXIMUM NUMBER OF MODULES THAT ARE GROUPED IN
%                       THE INPUT CHROMOSOME VECTOR
%
% ENGINEERS: JAMES S COLLINS
%            BEN DUSSALT
%            NAMKHA NORSANG
%            NISHANTH KATHIRVEL
%
% PROJECT: ME 6101 GREEN MODULAR DESIGN GROUP PROJECT
% DATE: NOVEMBER 2017
% LOCATION: GEORGIA INSTITUTE OF TECHNOLOGY. ALT, GA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    L=length(ChromeVec); % GET THE LENGTH OF THE CHROMOSOME INPUT IE THE 
                         % TOTAL NUMBER OF COMPONENTS
    
    % IDENTIFING MAXIMUM MODULE NUMBER IN CHROMOSOME AND DECLARING THE
    % OUTPUT LOGICAL ARRAY
    n=max(ChromeVec);
    newChromeVec=false(n,L);
    
    % FOR LOOP TO SEPAREATE GENES INTO INDIVIDUAL ROWS MARKING DIFFERENT
    % COLUMNS
    for i=1:n
        newChromeVec(i,:)=ChromeVec==i; % GENERATING LOGICAL MASK ROWS
    end
    
    deleteMask=~any(newChromeVec,2); % CREATION OF LOGICAL MASK IDENTIFING
                                     % ROWS CONTAINING ALL FALSE INDICES
   
                                     
    newChromeVec(deleteMask,:)=[];
                                     % IDENTIFING THE NUMBER OF FILLED/
                                     % NONEMPTY ROWS OF THE BOOLEAN ARRAY
                                     % TO BE USED FOR LATER BILEVEL
                                     % CALCULATION OUTSIDE THE FUNCTION AS
                                     % THE OUTPUT VARIABLE m
    [m,~]=size(newChromeVec);
                                     
    newChromeVec=double(newChromeVec); % CONVERTING OUTPUT TO DOUBLE FOR 
                                       % LATER CALCULATION 

end