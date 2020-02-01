function sa_demo
clc,clear,close all
% Initializing parameters and settings
T_init =50; % Initial temperature
T_min = 25; % Final stopping temperature
max_run=5; % Maximum number of runs
k = 1; % Boltzmann constant
alpha=0.8; % Cooling factor
x_init=[1 5 2 4 3]; % Initial point
% Initializing the counters
i= 0; totaleval = 0;
% Initializing various values
T = T_init;
E_init = fobj(x_init);
E_old = E_init; E_new=E_old;
best=x_init; % initially values
% Starting the simulated annealling
while (T > T_min)
i = i+1;
% Check if max numbers of run/accept are met
if (i >= max_run)
% Cooling according to a cooling schedule
T = alpha*T;
totaleval = totaleval + i;
% reset the counters
i = 1;
end
% Function evaluations at new locations
ns = x_init(randperm(length(x_init)));
E_new = fobj(ns);
disp(E_new);
disp(ns);
% Decide to accept the new solution
DeltaE=E_new-E_old;
% Accept if improved
if (-DeltaE > 0)
best = ns; E_old = E_new;
end
% Accept with a small probability if not improved
if (exp(-DeltaE/(k*T))>rand );
best = ns; E_old = E_new;
else
end
% Update the estimated optimal solution
f_opt=E_old;
end
% Display the final results
disp(strcat('Evaluations :', num2str(totaleval)));
disp(strcat('Best solution:', num2str(best)));
disp(strcat('Best objective:', num2str(f_opt)));
function z=fobj(x)
A = [1000000 100 450 690 210;100 1000000 260 700 180;450 260 1000000 350 290;690 700 350 1000000 320;210 180 290 320 1000000];
z=A(x(1),x(2))+A(x(2),x(3))+A(x(3),x(4))+A(x(4),x(5))+A(x(5),x(1));