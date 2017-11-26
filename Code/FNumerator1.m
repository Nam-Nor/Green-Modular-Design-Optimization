
function FNumeratorTerm1 = FNumerator1(vh,vs,m,chromArray)
% THIS FUNCTION CALCULATES THE FIRST NUMERATOR TERM OF THE F(X) DESIGN
% MEASURE. THIS FUNCTION ALONG WITH FNumerator2 SHOULD BE USED THROUGH THE
% BILEVEL OPTIMIZATION 
% FOR THE FORMULA, SEE EQUATION 8
%
% INPUT:  [NxN DOUBLE]  CCF ARRAY DEFINED AS v^s IN THE EQUATION
%         [NxN DOUBLE]  CCF ARRAY DEFINED AS v^h IN THE EQUATION 
%         [1x1 DOUBLE]  NUMBER OF MODULES (OUTPUT FROM CHROMOSORT FUNCTION)
%         [MxN DOUBLE]  ARRAY OUTPUT FROM CHROMOSORT FUNCTION
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
% LOCATION: GEORGIA INSTITUTE OF TECHNOLOGY. ALT, GA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=37; % SETTING THE COMPONENT NUMBER
FNumeratorTerm1=0; % DECLARING ITERATION VARIBLES
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