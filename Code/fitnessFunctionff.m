function FY = fitnessFunctionff(vg,crossOverChromosome)
% THIS FUNCTION CALCULATES THE FITNESS FUNCTION f(Y) DESIGN
% MEASURE. THIS FUNCTION SHOULD BE USED THROUGH THE BILEVEL OPTIMIZATION 
% ALONG WITH THE FIRST FITNESS FUNCTION F(X)
% FOR THE FORMULA, SEE EQUATION 9
%
% INPUT:  [NxN DOUBLE]  CCF ARRAY DEFINED AS v^g IN THE EQUATION
%         [MxN DOUBLE]  ARRAY OF LLCS FOR EACH ULC MODULE
%
% OUTPUT: [1x1 DOUBLE]  FITNESS f(Y) DESIGN MEASURE
%
% ENGINEERS: JAMES S COLLINS
%            BEN DUSSALT
%            NAMKHA NORSANG
%            NISHANTH KATHIRVEL
%
% PROJECT: ME 6101 GREEN MODULAR DESIGN GROUP PROJECT
% DATE: NOVEMBER 2017
% LOCATION: GEORGIA INSTITUTE OF TECHNOLOGY. ATL, GA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 [FNT1,mk] = ffNumerator1(vg,crossOverChromosome);
 [FNT2,~] = ffNumerator2(vg,m,crossOverChromosome);
 
 denom = 0;
 for i=1:1:m
   denom = denom + mk;
 end
 
 FY=(FNT1-FNT2)/denom;

end

function [ffNumeratorTerm1,mk] = ffNumerator1(vg,crossOverChromosome)
% THIS FUNCTION CALCULATES THE FIRST NUMERATOR TERM OF THE f(Y) DESIGN
% MEASURE. THIS FUNCTION ALONG WITH ffNumerator2 SHOULD BE USED THROUGH THE
% BILEVEL OPTIMIZATION 
% FOR THE FORMULA, SEE EQUATION 9
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SETTING THE COMPONENT NUMBER
n=37; 
% DECLARING ITERATION VARIABLES
ffNumeratorTerm1=0; 
numo=0;
denom=0;
% SORT THE INPUT INTO A R3 BINARY ARRAY
[binChromArray,mk] = chromoSortMultiDim(crossOverChromosome);
% ISOLATE THE LARGEST ELEMENT VALUE AS m
m = max(max(crossOverChromosome));
% THROW AN ERROR IF THE COMPONENT NUMBER (CHROMOSOME LENGTH) DOESN'T MATCH
assert(checkn==n,'SOMETHING IS WRONG WITH THE CHROMOSOME LENGTH');


% STARTING FIRST, EXTERIOR SUMMATION FOR LOOP
    for k = 1:1:m
        for j=1:1:mk
            % TWO NESTED SUMMATION THAT MAKE UP THE NUMERATOR FOR THE TERM
                for i=1:1:n 
                    for l=1:1:n
                        % PRODUCT OF INDEXED VALUES ON THE NUMERATOR 
                        % INCLUDED IN THE DOUBLE SUMMATION
                        v1=vg(i,l);
                        y1=binChromArray(k,j,i);
                        y2=binChromArray(k,j,l);
                        numo=numo+(y1*y2*v1);
                    end
                end

                % THIS BLOCK DEFINES THE SQUARED 
                % SUMMATION TERM IN THE DENOMINATOR 
                for l=1:1:n
                    denom=denom+binChromArray(k,j,l);
                end
                denom=(denom)^2;
                % EXTERNAL SUMMATION 
                ffNumeratorTerm1=ffNumeratorTerm1+(numo/denom);
                numo=0;
                denom=0;
        end
    end
end

function [ffNumeratorTerm2,mk] = ffNumerator2(vg,crossOverChromosome)
% THIS FUNCTION CALCULATES THE FIRST NUMERATOR TERM OF THE f(Y) DESIGN
% MEASURE. THIS FUNCTION ALONG WITH ffNumerator2 SHOULD BE USED THROUGH THE
% BILEVEL OPTIMIZATION 
% FOR THE FORMULA, SEE EQUATION 9
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% SETTING THE COMPONENT NUMBER
n=37; 
% DECLARING ITERATION VARIBLES
ffNumeratorTerm2=0; 
numo=0;
denom=0;  

% SORT THE INPUT INTO A R3 BINARY ARRAY
[binChromArray,mk] = chromoSortMultiDim(crossOverChromosome);
% ISOLATE THE LARGEST ELEMENT VALUE AS m
m = max(max(crossOverChromosome));
% THROW AN ERROR IF THE COMPONENT NUMBER (CHROMOSOME LENGTH) DOESN'T MATCH
assert(checkn==n,'SOMETHING IS WRONG WITH THE CHROMOSOME LENGTH');


% STARTING FIRST, EXTERIOR SUMMATION FOR LOOP
    for k = 1:1:m
        for j=1:1:mk
            % TWO NESTED SUMMATION THAT MAKE UP THE NUMERATOR FOR THE TERM
                for i=1:1:n 
                    for l=1:1:n
                        % PRODUCT OF INDEXED VALUES ON THE NUMERATOR 
                        % INCLUDED IN THE DOUBLE SUMMATION
                        v1=vg(i,l);
                        y1=binChromArray(k,j,i);
                        y2=abs(1-binChromArray(k,j,l));
                        numo=numo+(y1*y2*v1);
                    end
                end
                % THIS BLOCK DEFINES THE SQUARED 
                % SUMMATION TERM IN THE DENOMINATOR 
                for l=1:1:n
                    denom=denom+binChromArray(kj,l);
                end
                denom=(n-denom)^2;
                % EXTERNAL SUMMATION 
                ffNumeratorTerm2=ffNumeratorTerm2+(numo/denom);
                denom=0;
                numo=0;
        end
    end
end