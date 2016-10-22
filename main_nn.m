% perform preprocessing
preprocessing

% set parameter
anz_hl = 10;      % number of hidden layers
anz_xval = 50;      % number of xvalidations
anzClasses = 2;     % number of different labels
labelPos = size(data_pp(1,:),2);        % position of the label

% run nn algorithm
globalConfMatrixNN = [];
for hl = 1:anz_hl
    ConfMatrix_NN = zeros(3,anzClasses);
    for xval = 1:anz_xval      
        [ ConfMatrix ] = fkt_NN( data_pp(:, 1:(labelPos-1)), data_pp(:, labelPos), hl, 70/100, 15/100, 15/100 );
        ConfMatrix_NN = ConfMatrix_NN + ConfMatrix;        
        clear trainData testData ConfMatrix
    end    
    ConfMatrix_NN = ConfMatrix_NN / anz_xval;
    globalConfMatrixNN = [globalConfMatrixNN; ConfMatrix_NN];    
    X = ['hl = ', num2str(hl),'/',num2str(anz_hl)];
    disp(X)
end

% compute the performance
perc_nn = zeros(2,anz_hl);
for i = 1:anz_hl  
    perc_nn(1,i) = i;
    anz = 0;    
    for j = 1:anzClasses        
        if(isnan(globalConfMatrixNN(i*3,j)) == 0)        
            perc_nn(2,i) = perc_nn(2,i) + globalConfMatrixNN(i*3,j);
            anz = anz + 1;            
        end        
    end
    perc_nn(2,i) = perc_nn(2,i) / anz;
end

% plot the result
plot(1:anz_hl,perc_nn(2,:))
title('Total Percent of NN');
xlabel('Number Of Hiddel Layers');
ylabel('Accuracy');

% clear the workspace
clearvars -except globalConfMatrixNN perc_nn globalConfMatrixKNN perc_knn
