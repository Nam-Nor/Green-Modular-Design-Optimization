% VARIABLE HEADER RETITLER 
% REFORMATS THE FIRST 5 COLUMNS OF THE GREEN MODULAR DESIGN 
% OPTIMIZATION RESULTS TO BE CLEAR AND NEAT

% ENGINEER: JAMES S COLLINS

clc
clear
switchToggle = false;

while ~switchToggle
    varname = input('PLEASE INPUT THE VARIABLE FILE NAME:  ','s');
    varname = [varname,'.mat'];
    disp('...')
    
    fls = dir;
    fls = {fls.name};
    membLogical = any(ismember(varname,fls));
    
        if membLogical

            load(varname);
            cellTitle = {['ALPHA:'],['BETA:'],['F:'],['f:'],['VECTOR:']};
            for i = 1:1:5
            A{1,i} = cellTitle{i};
            end

            %disp(A(1,:));
            %OK = input('IS THIS RIGHT? [y/n]:  ','s');

            %if strcmpi(OK,'y') || strcmpi(OK,'yes')

                disp('...')
                userinput = input('ARE YOU DONE? [y/n]  ','s');
                inputlogical1 = strcmpi(userinput,'n');
                inputlogical2 = strcmpi(userinput,'no');
                inputlogical3 = strcmpi(userinput,'y');
                inputlogical4 = strcmpi(userinput,'yes');
                   if inputlogical1 || inputlogical2
                       switchToggle = false;
                   elseif inputlogical3 || inputlogical4
                       switchToggle = true;
                   else
                       error('YOUR INPUT IS INCORRECT');
                   end
                   varname = varname(1:end-4);
                   save([varname,'_HeaderFixed.mat'],'A')
            %else
                
            %    error('UH OH, SOMETHING IS WRONG');
            %end

        else 
            error('THE FILE IS NOT INCLUDED IN THE CURRENT FOLDER');
        end
end
clc
disp('OKAY. THANKS AND GREAT JOB!')