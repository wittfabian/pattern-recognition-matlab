% perform preprocessing
preprocessing

% set parameter
anz_k = 10;      % number of neighbors
anz_xval = 100;      % number of xvalidations
anzClasses = 2;     % number of different labels
labelPos = size(data_pp(1,:),2);        % position of the label
trainSize = 70/100;     % percent of the data for training

% run knn algorithm
globalConfMatrixKNN = [];
for k = 1:anz_k
    ConfMatrix_KNN = zeros(3,anzClasses);
    for xval = 1:anz_xval      
        [ trainData, testData ] = genTrainDataLabel( data_pp, anzClasses, labelPos, trainSize );
        [ ConfMatrix ] = fkt_knn( trainData(:, 1:(labelPos-1)), trainData(:, labelPos), testData(:, 1:(labelPos-1)), testData(:, labelPos), k );
        ConfMatrix_KNN = ConfMatrix_KNN + ConfMatrix;        
        clear trainData testData ConfMatrix
    end    
    ConfMatrix_KNN = ConfMatrix_KNN / anz_xval;
    globalConfMatrixKNN = [globalConfMatrixKNN; ConfMatrix_KNN];    
    X = ['k = ', num2str(k),'/',num2str(anz_k)];
    disp(X)
end

% compute the performance
perc_knn = zeros(2,anz_k);
for i = 1:anz_k  
    perc_knn(1,i) = i;
    anz = 0;    
    for j = 1:anzClasses        
        if(isnan(globalConfMatrixKNN(i*3,j)) == 0)        
            perc_knn(2,i) = perc_knn(2,i) + globalConfMatrixKNN(i*3,j);
            anz = anz + 1;            
        end        
    end
    perc_knn(2,i) = perc_knn(2,i) / anz;
end

% plot the result
plot(1:anz_k,perc_knn(2,:))
title('Total Percent of KNN');
xlabel('Number Of Neighbors');
ylabel('Accuracy');
minperc = min(perc_knn);
maxperc = max(perc_knn);

% clear the workspace
clearvars -except globalConfMatrixKNN perc_knn globalConfMatrixNN perc_nn