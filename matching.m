function id = matching(u, option )
    load('./SimilarityMatchingData/means.mat');
    load('./SimilarityMatchingData/standardDevs.mat');
    load('./SimilarityMatchingData/discriminationPowerNormalised.mat');
    load('./SimilarityMatchingData/trainData522.mat');
    dbData = trainData522;
    
%% %=============matching keys==================
    key = zeros(2,522)+0.0;
    key(1,:) = dbData(1,:);
    for i = 1 : 522
        key(2,i) = cosSim(u,dbData(4:26,i),discn, option);
    end
    key = sortrows(key',2);  
    key = key';    
    
%% %======giving top 3 values=======
    id = zeros(2,3);
    cnt=0;
    for i = 1:522
        if fix(id(1,1))~=fix(key(1,i)) && fix(id(1,2))~=fix(key(1,i)) && fix(id(1,3))~=fix(key(1,i))
           cnt = cnt +1;
           id(:,cnt) = key(:,i);
        end
        if cnt == 3           
            break;
        end       
    end

end