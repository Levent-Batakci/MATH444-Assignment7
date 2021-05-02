%Levent Batakci
%Assignment 7, MATH444
%Tree Regression Image recovery

%Load the image
%load Nodes
load MysteryImage.mat
load MaximalTree.mat
disp("Loaded");

%[root, Nodes, Leaves] = MaximalTree(rows, cols, vals, m, n);

%TRY PRUNING!
% alpha = 0.04;
% p = 15000;
% disp("Beginning pruning!");
% root = PruneTree(root, alpha, p);
% disp("Pruned!");

%Graph the given
fullImage =  zeros(m,n,3);

for i = 1:15000
    fullImage(rows(i), cols(i),:) = vals(i);
end
imshow(fullImage);

keyboard;
clf
fullImage =  zeros(m,n,3);

for i = 1:size(Leaves,2)
    leaf = Leaves{i};
    r = rowRange(leaf);
    c = colRange(leaf);
    
    color = zeros(1,1,3);
    color(1,1,:) = leaf.c;
    fullImage(r,c,:) = fullImage(r,c,:) + color;
    
    if(mod(i,2000) == 0)
        imshow(fullImage);
    end
end
imshow(fullImage);



disp("DONE!")