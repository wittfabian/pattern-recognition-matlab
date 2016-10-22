%load data
load('data/arrhythmia.mat');

data_pp = arrhythmia;

% delete examples where age < 19 (because BMI only valid over 19 years)
data_pp( data_pp(:,1) < 19,: ) = [];

% age: 1 = (19-29), 2 = (29-49), 3 = (50-69), 4 = (70-inf)
for d = 1:size(data_pp,1)
    if(data_pp(d,1) >= 19 && data_pp(d,1) < 30)
        data_pp(d,1) = 1;
    elseif(data_pp(d,1) >= 30 && data_pp(d,1) < 50)
        data_pp(d,1) = 2;
    elseif(data_pp(d,1) >= 50 && data_pp(d,1) < 70)
        data_pp(d,1) = 3;
    elseif(data_pp(d,1) >= 70)
        data_pp(d,1) = 4;
    end
end

%BMI
for d = 1:size(data_pp,1)
    data_pp(d,3) = data_pp(d,4) / ((data_pp(d,3)/100)^2);
end
data_pp(:,4) = [];

% delete examples where bmi < 15 and bmi > 50
data_pp( data_pp(:,3) < 15,: ) = [];
data_pp( data_pp(:,3) > 50,: ) = [];

% bmi: 1 = (<20), 2 = (20-25), 3 = (26-30), 4 = (31-40), 5 = (>40)
for d = 1:size(data_pp,1)
    if(data_pp(d,3) < 20)
        data_pp(d,3) = 1;
    elseif(data_pp(d,3) >= 20 && data_pp(d,3) < 26)
        data_pp(d,3) = 2;
    elseif(data_pp(d,3) >= 26 && data_pp(d,3) < 31)
        data_pp(d,3) = 3;
    elseif(data_pp(d,3) >= 31 && data_pp(d,3) < 41)
        data_pp(d,3) = 4;
    elseif(data_pp(d,3) >= 41)
        data_pp(d,3) = 5;
    end
end

data_pp(:,13) = [];

% edit labels to normal (1) and disease (2)
for d = 1:size(data_pp,1)
   if(data_pp(d,end) ~= 1)
       data_pp(d,end) = 2;
   end
end


% replace missing values, based on the 8 nearest neighbors
data_pp = inpaint_nans(data_pp, 5);

%generalize other columns without nom -> result is 4 percent worse
% nom = [20,21,22,23,24,25];
% for c = 4:size(data_pp(:,1:end-1),2)
%     if(any(nom == c) ~= 1)
%         col_vec = data_pp(:,c);
%         max_val = max(col_vec);
%         min_val = min(col_vec);
%         diff = (max_val - min_val)/5;
%     
%         for r = 1:size(data_pp(:,c),1)
%             if( data_pp(r,c) <= (min_val + diff) )
%                 data_pp(r,c) = 1;
%             elseif( (data_pp(r,c) > (min_val + diff)) && (data_pp(r,c) <= (min_val + 2*diff)) )
%                 data_pp(r,c) = 2;
%             elseif( (data_pp(r,c) > (min_val + 2*diff)) && (data_pp(r,c) <= (min_val + 3*diff)) )
%                 data_pp(r,c) = 3;
%             elseif( (data_pp(r,c) > (min_val + 3*diff)) && (data_pp(r,c) <= (min_val + 4*diff)) )
%                 data_pp(r,c) = 4;
%             elseif( (data_pp(r,c) > (min_val + 4*diff)) )
%                 data_pp(r,c) = 5;
%             end
%         end
%     end
% end

clearvars -except data_pp