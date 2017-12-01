%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BILEVEL OPTIMIZER MAIN SCRIPT
% FOR FALL 2017 ME 6101 FINAL PROJECT ON GREEN MODULAR DESIGN OPTIMIZATION
% ENGINEERS: JAMES S COLLINS
%            BEN DUSSALT
%            NAMKHA NORSANG
%            NISHANTH KATHIRVEL
%
% PROJECT: ME 6101 GREEN MODULAR DESIGN GROUP PROJECT
% DATE: NOVEMBER 2017
% LOCATION: GEORGIA INSTITUTE OF TECHNOLOGY. ATL, GA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

load Vg.mat;
load Vh.mat;
load Vs.mat;

Fstar=0.29;
fstar=0.17;

components=37;
ULiterations=2000;
LLiterations=2000;
population=50;

m=round(sqrt(components)); %inital max number of modules

% Store the alpha, beta (>=0) and the corresponding chromosome
A=cell(population,5); 

ULmembers = randi(m,[population components]);
LLmembers = zeros(population, components);
ULscores = randi(10,[population 1]);

for i=1:ULiterations
    % Perform CGA on ULmembers
    ULmembers=GreenModGeneticAlgorithm(ULmembers,ULscores);
    % now we have a new population of ULCs
    for j=1:population
        [X,binX,mk,m] = chromoSort(ULmembers(j,:)); %decompose each ULC
        F=fitnessFunctionF(Vh,Vs,m,ULmembers(j,:));
        ULscores(j,1)=F;
        alpha=(F-Fstar)/(1-Fstar);
        %%%%Evaluate Alpha(X)%%%
        if alpha<0
            break
        else
            binY=binX;
            Y=X;
            f=fitnessFunctionff(Vg,Y);
            beta=(f-fstar)/(1-fstar);
            %%%%Evaluate Beta(Y)%%%
            if beta>=0
                A(j,:)={[alpha],[beta],[F],[f],ULmembers(j,:)};
            else
                LLscores(1:size(Y,1),1)=f;
                for k=1:LLiterations
                    %%%%%perform CGA on Y%%%%%
                    Y=GreenModGeneticAlgorithm(Y,prevGenScores)
                    for l=1:size(Y,1)
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        [multiY,mk] = chromoSortMultiDim(Y(l));
                        %%%%evaluate beta(Y) %%%%
                        beta=2; %%dummy
                        if beta<0
                            break
                        else
                            X=Y;
                            %%%%evaluate alpha(X)%%%%%%
                            alpha=1; %dummy
                            if alpha<0
                                break
                            else
                                A(j)=X;
                            end
                        end
                    end
                end
            end
        end
    end
end
                    
        