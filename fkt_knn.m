function [ ConfMatrix ] = fkt_knn( trainFeatures, trainLabel, classifiFeatures, classifiLabel, NumNeighbors )


KNNStruct = ClassificationKNN.fit(trainFeatures, trainLabel, 'NumNeighbors', NumNeighbors);


% Classifying New Data with an SVM Classifier 
ResLabels = predict(KNNStruct, classifiFeatures);

%Erstellen der Confusion Matrix
erg = [classifiLabel ResLabels];



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
% ConfMatrix = [ConfMatrix; R01 R02 R03 R04 R05 R06 R07 R08 R09 R10 R11 R12 R13 R14 R15 R16];


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

