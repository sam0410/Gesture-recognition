function [tree1,tree2,tree3,tree4,tree5,tree6,tree7,tree8,tree9,tree10] = trainForest( )



%data set is with the labels
%no of trees in forest
load('data_set.mat');
B = 10;
%select half of the data set randomly
n = 900
data_set = [ p,label];


%choose at random data sets (n) with replacement
    k = datasample(data_set ,n,1,'Replace',false);
    Z = k(:,1:4);
    label = k(:,5);
    

    %return trained tree
    %create forest of these trees and corrosponding probability
    [ tree1 ]  = trainTree(Z,label);   
    
    k = datasample(data_set ,n,1,'Replace',false);
    Z = k(:,1:4);
    label = k(:,5);
    [ tree2 ]  = trainTree(Z,label);
    
    k = datasample(data_set ,n,1,'Replace',false);
    Z = k(:,1:4);
    label = k(:,5);
    [ tree3 ]  = trainTree(Z,label);
    
    k = datasample(data_set ,n,1,'Replace',false);
    Z = k(:,1:4);
    label = k(:,5);
    [ tree4 ]  = trainTree(Z,label);
    
    k = datasample(data_set ,n,1,'Replace',false);
    Z = k(:,1:4);
    label = k(:,5);
    [ tree5 ]  = trainTree(Z,label);
    
    k = datasample(data_set ,n,1,'Replace',false);
    Z = k(:,1:4);
    label = k(:,5);
    [ tree6 ]  = trainTree(Z,label);
    
    k = datasample(data_set ,n,1,'Replace',false);
    Z = k(:,1:4);
    label = k(:,5);
    [ tree7 ]  = trainTree(Z,label);
    
    k = datasample(data_set ,n,1,'Replace',false);
    Z = k(:,1:4);
    label = k(:,5);
    [ tree8]  = trainTree(Z,label);
    
    k = datasample(data_set ,n,1,'Replace',false);
    Z = k(:,1:4);
    label = k(:,5);
    [ tree9]  = trainTree(Z,label);
    
    k = datasample(data_set ,n,1,'Replace',false);
    Z = k(:,1:4);
    label = k(:,5);
    [ tree10 ]  = trainTree(Z,label);
    
  


end

