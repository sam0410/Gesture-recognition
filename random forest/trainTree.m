function [ tree] = trainTree( Z,label )





% fitrtree or fitctree



 tree = treefit(Z,label);
 treedisp(tree);


% 
% [ feature_no,restriction,Z1,Z2 ] = nodeDivider( Z );
% tree = [restriction,feature_no];
% 
% 
% 
% [ feature_no,restriction,Z11,Z12 ] = nodeDivider( Z1 );
% tree.first = [restriction,feature_no];
% 
% 
% [ feature_no,restriction,Z21,Z22 ] = nodeDivider( Z2 );
% tree.second = [restriction,feature_no];
% 
% 
% [ feature_no,restriction,Z111,Z112 ] = nodeDivider( Z11 );
% tree.first.first = [restriction,feature_no];
% probability(1) = probCal(Z111);
% probability(2) = probCal(Z112);
% 
% 
% [ feature_no,restriction,Z121,Z122 ] = nodeDivider( Z12 );
% tree.first.second = [restriction,feature_no];
% probability(3) = probCal(Z121);
% probability(4) = probCal(Z122);
% 
% 
% [ feature_no,restriction,Z211,Z212 ] = nodeDivider( Z21 );
% tree.second.first = [restriction,feature_no];
% probability(5) = probCal(Z211);
% probability(6) = probCal(Z212);
% 
% 
% [ feature_no,restriction,Z221,Z222 ] = nodeDivider( Z22 );
% tree.second.second = [restriction,feature_no];
% probability(7) = probCal(Z221);
% probability(8) = probCal(Z222);




end

