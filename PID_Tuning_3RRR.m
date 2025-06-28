clear DOF3_RRR

% Load and compile the model
model = 'PID';
load_system(model);
set_param(model, 'SimulationCommand', 'update');  % compile model

% Define control and measurement signal names (these must match internal signal names)
controls = {'Signal1', 'Signal2', 'Signal3'};
measurements = {'Signal1', 'Signal2', 'Signal3'};  % Adjust this if you have separate output names

% Create slTuner interface
ST = slTuner(model, controls, measurements);

% Add linearization points (best practice)
for i = 1:3
    addPoint(ST, controls{i});
    addPoint(ST, measurements{i});
end

% Tune and apply to PD controllers
for i = 1:3
    % Get transfer function from control to measurement
    T = getIOTransfer(ST, controls{i}, measurements{i});
    
    % Tune PID controller
    C = pidtune(T, 'PID');  % You can use 'PI' or 'PD' if needed
    
    % Construct PD block name (you said blocks are named PD1, PD2, PD3)
    pdBlock = sprintf('%s/PD%d', model, i);
    
    % Apply tuned gains to PD block
    set_param(pdBlock, 'P', num2str(C.Kp), ...
                        'I', num2str(C.Ki), ...
                        'D', num2str(C.Kd));
end

% Simulate the tuned model (optional)
sim("PID.slx");
