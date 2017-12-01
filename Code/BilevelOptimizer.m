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

vh=0; %dummy
vg=0; % dummy
vs=0; %dummy

Fstar=0.29;
fstar=0.17;

components=37;
ULiterations=2000;
LLiterations=2000;
population=50;

m=round(sqrt(components)); %inital max number of modules

% Store the alpha, beta (>=0) and the corresponding chromosome
A=cell(population,5); 

ULmembers=randi(m,[population components]);
LLmembers=zeros(population, components);

for i=1:ULiterations
    %%%%%perform CGA on ULmembers here%%%%%
    
    % now we have a new population of ULCs
    for j=1:population
        [~,binX,mk,m] = chromoSort(ULmembers(j,:)); %decompose each ULC
        F=fitnessFunctionF(vh,vs,m,binX);
        alpha=(F-Fstar)/(1-Fstar);
        %%%%Evaluate Alpha(X)%%%
        if alpha<0
            break
        else
            binY=binX;
            f=fitnessFunctionff(vg,binY);
            beta=(f-fstar)/(1-fstar);
            %%%%Evaluate Beta(Y)%%%
            if beta>=0
                A(j,:)={[alpha],[beta],[F],[f],ULmembers(j,:)};
            else
                LLmembers(1:population,:)=Y; %%Initalize all to Y
                for k=1:LLiterations
                    %%%%%perform CGA on LLmembers here%%%%%
                    % now we have a new population of LLCs
                    for l=1:population
                        [Y,m] = chromoSort(LLmembers(l,:));
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
                    
        