

 load('data_set.mat');
load('newtree.mat');
correct = 0;
for i = 1:size(p,1)
    
        features  = p(i,:);
        probability_graph = classPrediction( features,tree1,tree2,tree3,tree4,tree5,tree6,tree7,tree8,tree9,tree10 );
        if probability_graph == label(i)
            correct = correct+1;
        end
end





