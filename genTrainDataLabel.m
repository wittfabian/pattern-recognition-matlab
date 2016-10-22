function [ trainData, testData ] = genTrainDataLabel( data, anzClasses, label_pos, ratio )

    trainData = [];
    testData = [];
    
    anzClassesRatio = [];
    
    %calculate size for each class
    for k = 1:anzClasses
        
        anzClassesRatio = [ anzClassesRatio; round( size(find(data(:,label_pos) == k), 1) * ratio ) ];
        
    end
    
    countClasses = zeros(anzClasses,1);
    
    
    for p = 1:anzClasses
        
        % if percentage for class p > 0 and more then zero examples in the
        % data-set
        if anzClassesRatio(p, 1) > 0 && size(find(data(:,label_pos) == p), 1) > 0
        
            % iterate throught all classes whie we need more examples for
            % class p
            while countClasses(p,1) < anzClassesRatio(p, 1) 

                % find indexes for class p
                tempRandIdx = find(data(:,label_pos) == p);
                % select random index
                randIdx = tempRandIdx(randi([1, size(find(data(:,label_pos) == p), 1)], 1, 1), 1);

                % if selected examples has class p
                if data(randIdx, label_pos) == p

                    % read current examle
                    trainData = [ trainData; data(randIdx, :) ];
                    % delete the example from the data-set
                    data(randIdx,:) = []; 
                    % set couted class plus one
                    countClasses(p,1) = countClasses(p,1) + 1;
                end

            end  
            
        end
        
    end

    % test-data = whole-data - train-data
    testData = data;
    
end

