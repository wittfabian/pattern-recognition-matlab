function [ ConfMatrix ] = fkt_NN( trainFeatures, trainLabel, hiddenLayerSize, trainRatio, valRatio, testRatio )

inputs = trainFeatures';
targets = trainLabel';

% Create a Fitting Network
% hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize);

% Choose Input and Output Pre/Post-Processing Functions
% For a list of all processing functions type: help nnprocess
net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
net.outputs{2}.processFcns = {'removeconstantrows','mapminmax'};

% Setup Division of Data for Training, Validation, Testing
% For a list of all data division functions type: help nndivide
net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = trainRatio; %70/100;
net.divideParam.valRatio = valRatio; %15/100;
net.divideParam.testRatio = testRatio; %15/100;

% For help on training function 'trainlm' type: help trainlm
% For a list of all training functions type: help nntrain
net.trainFcn = 'trainlm';  % Levenberg-Marquardt
% net.trainFcn = 'traingdx';  % Variable Learning Rate Backpropagation

% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net.performFcn = 'mse';  % Mean squared error

% Choose Plot Functions
% For a list of all plot functions type: help nnplot
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', 'plotconfusion',  ...
  'plotregression', 'plotfit'};

% Hide Window
net.trainParam.showWindow = false;
net.trainParam.showCommandLine = false; 


% Train the Network
[net, tr] = train(net,inputs,targets);

% Test the Network
outputs = round(net(inputs));
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs);

% Recalculate Training, Validation and Test Performance
trainTargets = targets .* tr.trainMask{1};
valTargets = targets  .* tr.valMask{1};
testTargets = targets  .* tr.testMask{1};
trainPerformance = perform(net,trainTargets,outputs);
valPerformance = perform(net,valTargets,outputs);
testPerformance = perform(net,testTargets,outputs);

% View the Network
% view(net)

test_result = [errors performance trainTargets valTargets testTargets trainPerformance valPerformance testPerformance];

%Erstellen der Confusion Matrix
erg = [targets' outputs'];

% anz01 = sum(erg(:, 1) == 1);
% anz02 = sum(erg(:, 1) == 2);
% anz03 = sum(erg(:, 1) == 3);
% anz04 = sum(erg(:, 1) == 4);
% anz05 = sum(erg(:, 1) == 5);
% anz06 = sum(erg(:, 1) == 6);
% anz07 = sum(erg(:, 1) == 7);
% anz08 = sum(erg(:, 1) == 8);
% anz09 = sum(erg(:, 1) == 9);
% anz10 = sum(erg(:, 1) == 10);
% anz11 = sum(erg(:, 1) == 11);
% anz12 = sum(erg(:, 1) == 12);
% anz13 = sum(erg(:, 1) == 13);
% anz14 = sum(erg(:, 1) == 14);
% anz15 = sum(erg(:, 1) == 15);
% anz16 = sum(erg(:, 1) == 16);
% 
% Ges01 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 1));
% Ges02 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 2));
% Ges03 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 3));
% Ges04 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 4));
% Ges05 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 5));
% Ges06 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 6));
% Ges07 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 7));
% Ges08 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 8));
% Ges09 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 9));
% Ges10 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 10));
% Ges11 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 11));
% Ges12 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 12));
% Ges13 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 13));
% Ges14 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 14));
% Ges15 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 15));
% Ges16 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 16));
% 
% R01 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 1)) / anz01 * 100;
% R02 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 2)) / anz02 * 100;
% R03 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 3)) / anz03 * 100;
% R04 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 4)) / anz04 * 100;
% R05 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 5)) / anz05 * 100;
% R06 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 6)) / anz06 * 100;
% R07 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 7)) / anz07 * 100;
% R08 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 8)) / anz08 * 100;
% R09 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 9)) / anz09 * 100;
% R10 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 10)) / anz10 * 100;
% R11 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 11)) / anz11 * 100;
% R12 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 12)) / anz12 * 100;
% R13 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 13)) / anz13 * 100;
% R14 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 14)) / anz14 * 100;
% R15 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 15)) / anz15 * 100;
% R16 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 16)) / anz16 * 100;
% 
% ConfMatrix = [anz01 anz02 anz03 anz04 anz05 anz06 anz07 anz08 anz09 anz10 anz11 anz12 anz13 anz14 anz15 anz16];
% 
% ConfMatrix = [ConfMatrix; Ges01 Ges02 Ges03 Ges04 Ges05 Ges06 Ges07 Ges08 Ges09 Ges10 Ges11 Ges12 Ges13 Ges14 Ges15 Ges16];
% 
% ConfMatrix = [R01 R02 R03 R04 R05 R06 R07 R08 R09 R10 R11 R12 R13 R14 R15 R16];

anz01 = sum(erg(:, 1) == 1);
anz02 = sum(erg(:, 1) == 2);

Ges01 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 1));
Ges02 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 2));


R01 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 1)) / anz01 * 100;
R02 = (sum(erg(:, 1) == erg(:, 2) & erg(:, 1) == 2)) / anz02 * 100;


ConfMatrix = [anz01 anz02];

ConfMatrix = [ConfMatrix; Ges01 Ges02];

ConfMatrix = [ConfMatrix; R01 R02];

end

