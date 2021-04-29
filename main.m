%Levent Batakci
%Assignment 7, MATH444
%Tree Regression Image recovery

%Load the image
%load Nodes
load MysteryImage.mat
load MaximalTree.mat


% s = datasample(1:15000, 15000,'Replace',false);
% rows = rows(s)';
% cols = cols(s)';
% vals = vals(s,:)';

% Tmax = 10;
% alpha_0 = 0;
% 
% avgVal = mean(vals);
% root = Node(rows, cols, vals, m, 1, n, 1);
% Nodes = cell(1);
% Nodes{1} = root;
% 
% %GROW THE TREE !
% Lpure = [];
% Lmixed = [1];
% m=1;
% 
% Leaves = cell(1);
% i = 1;
% while numel(Lmixed) ~= 0
%     index = Lmixed(1);
%     chosen = Nodes{index}; %Choose mixed node
%     
%     %Adjust Lmixed
%     if(numel(Lmixed) == 1)
%         Lmixed = [];
%     else
%         Lmixed = Lmixed(2:end);
%     end
%     
%     %Optimally split the node
%     chosen = splitNode(chosen);
%     
%     %Check the children
%     L = chosen.left;
%     m=m+1;
%     if(getErr(L) ~= 0)
%         Lmixed(end+1) = m;
%     else
%         Lpure(end+1) = m;
%         Leaves{i} = L;
%         i=i+1;
%     end
%     Nodes{m} = L;
%     
%     R = chosen.right;
%     m=m+1;
%     if(getErr(R) ~= 0)
%         Lmixed(end+1) = m;
%     else
%         Lpure(end+1) = m;
%         Leaves{i} = R;
%         i=i+1;
%     end
%     Nodes{m} = R;
%     
%     if(mod(m+1,100) == 0)
%         disp(m)
%     end
% end
% 
% root = Nodes{1};

s1 = datasample(1:m, 750,'Replace',false);
s2 = datasample(1:n, 750,'Replace',false);
% for i = 1:m
%     for j = 1:n
%         c = color(root, i, j);
%         fullImage(i, j,:) = c;
%     end
%     if(mod(i,5) == 0)
%         disp(i)
%         imshow(fullImage)
%     end
% end

load Leaves
m=2736;
fullImage =  zeros(m,n,3);
disp("Loaded");
for i = 1:size(Leaves,2)
    leaf = Leaves{i};
    r = rowRange(leaf);
    c = colRange(leaf);
    
    color = zeros(1,1,3);
    color(1,1,:) = leaf.c;
    fullImage(r,c,:) = fullImage(r,c,:) + color;
    
    if(mod(i,500) == 0)
        imshow(fullImage);
    end
end
imshow(fullImage);

disp("DONE!")