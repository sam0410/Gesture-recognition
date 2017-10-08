function [ probability_graph ] = classPrediction( features,tree1,tree2,tree3,tree4,tree5,tree6,tree7,tree8,tree9,tree10 )




%no of gestures can be recognized
%NO OF LABELS
%length of forest 10
%no of trees is length of forest
label = zeros(10,1);

    % GIVES TREE AND ITS CORROSPONDING PROBABILITY
    label(1) = testTree(tree1,features);
    label(2) = testTree(tree2,features);
    label(3) = testTree(tree3,features);
    label(4) = testTree(tree4,features);
    label(5) = testTree(tree5,features);
    label(6) = testTree(tree6,features);
    label(7) = testTree(tree7,features);
    label(8) = testTree(tree8,features);
    label(9) = testTree(tree9,features);
    label(10) = testTree(tree10,features);
    



    probability_graph = round((sum(label))/10);


end

