% GREEN MODULAR DESIGN SOLUTION SET A RESULT PLOTTER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

varname = input('PLEASE INPUT THE VARIABLE FILE NAME:  ','s');
    varname = [varname,'.mat'];
    disp('...')
    
    fls = dir;
    fls = {fls.name};
    membLogical = any(ismember(varname,fls));
    
        if membLogical
            load(varname);
        else
            error('THE FILE IS NOT PART OF THE CURRENT DIRECTOR');
        end

        rws = size(A,1);
        
        
        alpha=[];
        beta=[];
        F=[];
        f=[];
        vec=[];
        
        
        
        for i = 2:1:rws
            alpha = [alpha;A{i,1}];
            beta = [beta;A{i,2}];
            F = [F;A{i,3}];
            f = [f;A{i,4}];
            vec = [vec;A{i,5}];
        end

figure
subplot(1,2,1)
plot(alpha,beta,'*')
grid on
title('Alpha v. Beta')
xlabel('Technical System Satisfactory Degree (Alpha)');
ylabel('Material Reuse Satisfactory Degree (Beta)');
subplot(1,2,2)
plot(F,f,'*')
grid on
title('F v. f')
xlabel('Technical System Modularity (TSM) Measure F');
ylabel('Material Reuse Modularity (MRM) Measure f');

pVec=alpha+beta;

