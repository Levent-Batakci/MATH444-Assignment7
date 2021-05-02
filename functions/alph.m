function a = alph(root,p)

    a = numel(root.rows)*getMErr(root);
    
    L = get_leaves(root);
    s=0;
    for i = 1:size(L,2)
        leaf = L(i);
        s = s + numel(leaf.rows)*getMErr(leaf);
    end
    a = (a - s)/p;
    a = a/(size(L,2) - 1);
end

