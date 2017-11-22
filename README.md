# Green Modular Design Optimization

Algorithm implementation derived from BLEAQ2
------------------------------------------------------------------------
BLEAQ2 is the second version of a computationally efficient evolutionary algorithm for non-linear bilevel optimization problems. 
https://github.com/ankurzing/bleaq2

TO-DO LIST
------------------------------------------------------------------------
* Populate CCF matrices for vg1-4, vh1-3 and vs1-3 (Other group)
* Consolidate into vg, vh and vs
* Weighting values for W and w (should be same as the ones used in paper- discuss with group)
* Use a nested for loop structure to convert a raw Design vector chromosome to the tuned binary representation.
* Note: Fitness function F(X) is in ulExternalProblem.m  and f(Y) is in  llExternalProblem.m Write them out! (their inputs are the tuned binary design vectors)
* Alpha and Beta can then be created in ulTestProblem.m and llTestProblem.m, respectively.
* Initialize the max # of modules, etc in externalProblem.m
* Find a way to decompose ULC to LLCs.



Executing a user-defined problem
------------------------------------------------------------------------
To execute a user-defined problem, code the upper level optimization task in ulExternalProblem.m and the lower level optimization task in llExternalProblem.m. The functions inside the files contain arguments xu and xl, which represent the upper level decision vector and lower level decision vector respectively.

Provide the problem and algorithm parameters for user-defined problem in externalProblem.m and call the following command to execute the user-defined bilevel optimization task.
externalProblem()

The results of the execution are printed on the screen as well as stored in 'externalProblem.mat'. A sample bilevel optimization problem is already coded as an external problem.

Problem parameters to be defined in externalProblem.m

ulDim: Number of dimensions at upper level.

llDim: Number of dimensions at lower level.

ulDimMax: Vector defining maximum values for upper level variables.

ulDimMin: Vector defining minimum values for upper level variables.

llDimMax: Vector defining maximum values for lower level variables.

llDimMin: Vector defining minimum values for lower level variables.

Algorithm parameters to be defined in externalProblem.m

ulPopSize: Upper level population size.

llPopSize: Lower level population size.

ulMaxGens: Upper level maximum generations.

llMaxGens: Lower level maximum generations.

ulStoppingCriteria: Stopping parameter at upper level. Smaller the value higher the accuracy.

llStoppingCriteria: Stopping parameter at lower level. Smaller the value higher the accuracy.

There are other parameters in the algorithm. However, most of them are either adaptive or not necessary to be adjusted.

Output of the execution

ulEliteFunctionValue: Upper level function value for the elite member.

llEliteFunctionValue: Lower level function value for the elite member.

ulEliteIndiv: Upper level elite member.

llEliteIndiv: Lower level elite member.

ulFunctionEvaluations: Upper level function evaluations required during the exection.

llFunctionEvaluations: Lower level function evaluations required during the exection.


Files in the package
------------------------------------------------------------------------
There are the following Matlab (.m) files in this package:

ulSearch.m: Performs search at the upper level.

llSearch.m: Performs search at the lower level.

quadApprox.m: Supporting file for quadratic creating quadratic approximations.

ulTestProblem.m: Source code for upper level SMD and TP suite.

llTestProblem.m: Source code for lower level SMD and TP suite.

ulExternalProblem.m: Source code for upper level optimization task for a user defined problem.

ulExternalProblem.m: Source code for lower level optimization task for a user defined problem

terminationCheck.m: Source code for the termination criteria used in the algorithm. This can be modified based on the user's requirements.

smd1.m - smd14.m: These files contain the problem and algorithm parameters for SMD-Suite. The implementation for the test problems can be found in the ulTestProblem.m and llTestProblem.m files.

tp1.m - tp10.m: These files contain the problem and algorithm parameters for TP-Suite. The implementation for the test problems can be found in the ulTestProblem.m and llTestProblem.m files.

externalProblem.m: It contains the problem and algorithm parameters for a user defined problem.

msmd1: This file contains the problem and algorithm parameters for a sample multiobjective bilevel optimization problem. The implementation for the test problem can be found in the ulTestProblem.m and llTestProblem.m files.

Following are other supporting files
------------------------------------------------------------------------
calculateCrowdingDistance.m

nonDominatedSorting.m

getMappings.m

getLowerLevelVariableFromMapping.m

getOptimalSolutionSMD.m