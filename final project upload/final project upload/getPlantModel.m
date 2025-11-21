function ssPlant = getPlantModel(states, inputs, Ts)
%Fine the current operating point and linearize the Simulink model
opspec = operspec('Lab13remix');
%set up opspec.X(i).x to current states, opspec.U(i).u to current inputs

op = findop('Lab13remix', opspec);
sys = linearize('Lab13remix',op);
% Discretize
ssPlant = c2d(sys, Ts); % 'ssplant' is now your discrete LTI plant