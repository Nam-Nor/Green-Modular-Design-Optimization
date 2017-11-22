function [ulEliteFunctionValue, llEliteFunctionValue, ulEliteIndiv, llEliteIndiv, ulFunctionEvaluations, llFunctionEvaluations,llCalls,gen,ulDim,llDim,ulPopSize,llPopSize] = tp6()

problemName = 'tp6';             % Test problem name

ulPopSize=50;                    % Size of UL population
ulMaxGens=2000;                  % Maximum number of generations allowed at UL
ulDim=2;                         % Number of dimensions

llPopSize=50;                    % Size of LL population
llMaxGens=2000;                  % Maximum number of generations allowed at LL
llDim=2;                         % Number of dimensions

ulDimMin = zeros(1,ulDim);       % Minimum bound accross UL dimensions
ulDimMax = 2*ones(1,ulDim);      % Maximum bound accross UL dimensions

llDimMin = zeros(1,llDim);       % Minimum bound accross LL dimensions
llDimMax = 2*ones(1,llDim);      % Maximum bound accross LL dimensions

ulStoppingCriteria = 1e-4;
llStoppingCriteria = 1e-5;

[ulEliteFunctionValue, llEliteFunctionValue, ulEliteIndiv, llEliteIndiv, ulFunctionEvaluations, llFunctionEvaluations,llCalls,gen]=ulSearch(problemName, ulPopSize, ulMaxGens, ulDim, ulDimMin, ulDimMax, llPopSize, llMaxGens, llDim, llDimMin, llDimMax, ulStoppingCriteria, llStoppingCriteria);

save('tp6');