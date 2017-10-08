function [ label ] = testTree( tree,features )





label = round(eval(tree,features));

% if features(tree(2)) < tree.first(1)
%     if feature(tree.first(2) < tree.first(1))
%         if feature(tree.first.first(2) < tree.first.first(1))
%             prob = probability(1);
%             
%         else
%             prob = probability(2);
%         end
%             
%     else
%         if feature(tree.first.second(2) < tree.first.first(1))
%             prob = probability(3);
%             
%         else
%             prob = probability(4);
%         end
%     end
%     
% else
%     if feature(tree.second(2) < tree.first(1))
%         if feature(tree.second.first(2) < tree.first.first(1))
%             prob = probability(5);
%             
%         else
%             prob = probability(6);
%         end
%             
%     else
%         if feature(tree.second.second(2) < tree.first.first(1))
%             prob = probability(7);
%             
%         else
%             prob = probability(8);
%         end
%     end
%     
%     
%       
% end


end

