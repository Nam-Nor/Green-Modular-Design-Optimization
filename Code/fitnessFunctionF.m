
function FX = fitnessFunctionF(vh,vs,chromosome)
% THIS FUNCTION CALCULATES THE FITNESS FUNCTION F(X) DESIGN
% MEASURE. THIS FUNCTION SHOULD BE USED THROUGH THE BILEVEL OPTIMIZATION 
% ALONG WITH THE SECOND FITNESS FUNCTION f(X)
% FOR THE FORMULA, SEE EQUATION 8
%
% INPUT:  [NxN DOUBLE]  CCF ARRAY DEFINED AS v^s IN THE EQUATION
%         [NxN DOUBLE]  CCF ARRAY DEFINED AS v^h IN THE EQUATION 
%         [1xN DOUBLE]  DESIGN CHROMOSOME VECTOR
% OUTPUT: [1x1 DOUBLE]  FIRST NUMERATOR TERM CALCULATED FOR THE F(X) 
%                       DESIGN MEASUREMENT 
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

 [~,binChromosomeArray,~,m]=chromoSort(chromosome); 

 FNT1=FNumerator1(vh,vs,m,binChromosomeArray);
 FNT2=FNumerator2(vh,vs,m,binChromosomeArray);
 
 FX=(FNT1-FNT2)/m;

end


function FNumeratorTerm1 = FNumerator1(vh,vs,m,chromArray)
% THIS FUNCTION CALCULATES THE FIRST NUMERATOR TERM OF THE F(X) DESIGN
% MEASURE. THIS FUNCTION ALONG WITH FNumerator2 SHOULD BE USED THROUGH THE
% BILEVEL OPTIMIZATION 
% FOR THE FORMULA, SEE EQUATION 8
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SETTING THE COMPONENT NUMBER
n=37; 
% DECLARING ITERATION VARIBLES
FNumeratorTerm1=0; 
numo=0;
denom=0;    

% STARTING FIRST, EXTERIOR SUMMATION FOR LOOP
    for k=1:1:m
        % TWO NESTED SUMMATION THAT MAKE UP THE NUMERATOR FOR THE TERM
            for i=1:1:n 
                for j=1:1:n
                    % PRODUCT OF INDEXED VALUES ON THE NUMERATOR 
                    % INCLUDED IN THE DOUBLE SUMMATION
                    v1=vh(i,j);
                    v2=vs(i,j);
                    x1=chromArray(k,i);
                    x2=chromArray(k,j);
                    numo=numo+(x1*x2*v1*v2);
                end
            end

            % THIS BLOCK DEFINES THE SQUARED 
            % SUMMATION TERM IN THE DENOMINATOR 
            for l=1:1:n
                denom=denom+chromArray(k,l);
            end
            denom=(denom)^2;
            % EXTERNAL SUMMATION 
            FNumeratorTerm1=FNumeratorTerm1+(numo/denom);
    end
end

function FNumeratorTerm2 = FNumerator2(vh,vs,m,chromArray)
% THIS FUNCTION CALCULATES THE SECOND NUMERATOR TERM OF THE F(X) DESIGN
% MEASURE. THIS FUNCTION ALONG WITH FNumerator2 SHOULD BE USED THROUGH THE
% BILEVEL OPTIMIZATION 
% FOR THE FORMULA, SEE EQUATION 8
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=37; % SETTING THE COMPONENT NUMBER
FNumeratorTerm2=0; % DECLARING ITERATION VARIBLES
numo=0;
denom=0;    

% STARTING FIRST, EXTERIOR SUMMATION FOR LOOP
    for k=1:1:m
        % TWO NESTED SUMMATION THAT MAKE UP THE NUMERATOR FOR THE TERM
            for i=1:1:n 
                for j=1:1:n
                    % PRODUCT OF INDEXED VALUES ON THE NUMERATOR 
                    % INCLUDED IN THE DOUBLE SUMMATION
                    v1=vh(i,j);
                    v2=vs(i,j);
                    x1=chromArray(k,i);
                    x2=abs(1-(chromArray(k,j)));
                    numo=numo+(x1*x2*v1*v2);
                end
            end

            % THIS BLOCK DEFINES THE SQUARED 
            % SUMMATION TERM IN THE DENOMINATOR 
            for l=1:1:n
                denom=denom+chromArray(k,l);
            end
            denom=(n-denom)^2;
            % EXTERNAL SUMMATION 
            FNumeratorTerm2=FNumeratorTerm2+(numo/denom);
    end
end