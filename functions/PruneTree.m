function root = PruneTree(root, alpha, p)

    calc_leaves(root);
    [n, alph] = BestToPrune(root,p);
    prune(n);
    
    while(alph <= alpha && ~isLeaf(root))
        calc_leaves(root);
        [n, alph] = BestToPrune(root,p)
        prune(n);
    end
end

