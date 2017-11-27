function FY = fitnessFunctionff(vg,m,ChromeArr)
% THIS FUNCTION CALCULATES THE FITNESS FUNCTION f(Y) DESIGN
% MEASURE. THIS FUNCTION SHOULD BE USED THROUGH THE BILEVEL OPTIMIZATION 
% ALONG WITH THE FIRST FITNESS FUNCTION F(X)
% FOR THE FORMULA, SEE EQUATION 9
%
% INPUT:  [NxN DOUBLE]  CCF ARRAY DEFINED AS v^g IN THE EQUATION
%         [1x1 DOUBLE]  NUMBER OF MODULES (OUTPUT FROM CHROMOSORT FUNCTION)
%         [MxN DOUBLE]  ARRAY OF LLCS FOR EACH ULC MODULE
% OUTPUT: [1x1 DOUBLE]  FITNESS f(Y) DESIGN MEASURE
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

 FNT1=ffNumerator1(vg,m,ChromeArr);
 FNT2=ffNumerator2(vg,m,ChromeArr);
 den = 0;
 
 %FINDING DENOMINATOR TERM
 for i = 1:1:m
     [mk, ~] = chromoSort(ChromeArr(k,:));
     den = den + mk;
 end
 
 FY=(FNT1-FNT2)/den;

end

function ffNumeratorTerm1 = ffNumerator1(vg,m,ChromeArr)
% THIS FUNCTION CALCULATES THE FIRST NUMERATOR TERM OF THE f(Y) DESIGN
% MEASURE. THIS FUNCTION ALONG WITH ffNumerator2 SHOULD BE USED THROUGH THE
% BILEVEL OPTIMIZATION 
% FOR THE FORMULA, SEE EQUATION 9
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=37; % SETTING THE COMPONENT NUMBER
ffNumeratorTerm1=0; % DECLARING ITERATION VARIBLES
numo=0;
denom=0;    

% STARTING FIRST, EXTERIOR SUMMATION FOR LOOP
    for k = 1:1:m
        [mk, chromArray] = chromoSort(ChromeArr(k,:));
        for j=1:1:mk
            % TWO NESTED SUMMATION THAT MAKE UP THE NUMERATOR FOR THE TERM
                for i=1:1:n 
                    for l=1:1:n
                        % PRODUCT OF INDEXED VALUES ON THE NUMERATOR 
                        % INCLUDED IN THE DOUBLE SUMMATION
                        v1=vg(i,l);
                        y1=chromArray(j,i);
                        y2=chromArray(j,l);
                        numo=numo+(y1*y2*v1);
                    end
                end

                % THIS BLOCK DEFINES THE SQUARED 
                % SUMMATION TERM IN THE DENOMINATOR 
                for l=1:1:n
                    denom=denom+chromArray(j,l);
                end
                denom=(denom)^2;
                % EXTERNAL SUMMATION 
                ffNumeratorTerm1=ffNumeratorTerm1+(numo/denom);
                numo=0;
                denom=0;
        end
    end
end

function ffNumeratorTerm2 = ffNumerator2(vg,m,ChromeArr)
% THIS FUNCTION CALCULATES THE FIRST NUMERATOR TERM OF THE f(Y) DESIGN
% MEASURE. THIS FUNCTION ALONG WITH ffNumerator2 SHOULD BE USED THROUGH THE
% BILEVEL OPTIMIZATION 
% FOR THE FORMULA, SEE EQUATION 9
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=37; % SETTING THE COMPONENT NUMBER
ffNumeratorTerm2=0; % DECLARING ITERATION VARIBLES
numo=0;
denom=0;    

% STARTING FIRST, EXTERIOR SUMMATION FOR LOOP
    for k = 1:1:m
        [mk, chromArray] = chromoSort(ChromeArr(k,:));
        for j=1:1:mk
            % TWO NESTED SUMMATION THAT MAKE UP THE NUMERATOR FOR THE TERM
                for i=1:1:n 
                    for l=1:1:n
                        % PRODUCT OF INDEXED VALUES ON THE NUMERATOR 
                        % INCLUDED IN THE DOUBLE SUMMATION
                        v1=vg(i,l);
                        y1=chromArray(j,i);
                        y2=abs(1-chromArray(j,l));
                        numo=numo+(y1*y2*v1);
                    end
                end

                % THIS BLOCK DEFINES THE SQUARED 
                % SUMMATION TERM IN THE DENOMINATOR 
                for l=1:1:n
                    denom=denom+chromArray(j,l);
                end
                denom=(n-denom)^2;
                % EXTERNAL SUMMATION 
                ffNumeratorTerm2=ffNumeratorTerm2+(numo/denom);
                denom=0;
                numo=0;
        end
    end
end