function [best, alph_best] = BestToPrune(root, p)

    if(~isLeaf(root.left))
        [best, alph_best] = BestToPrune(root.left, p);
        
        if(alph_best ~= 0)
            if(~isLeaf(root.right))
                [b, a] = BestToPrune(root.right, p);
                if(a < alph_best)
                    alph_best = a;
                    best = b;
                end
            end
            
            if(alph_best ~= 0)
                b = root;
                a = alph(root,p);
                if(a < alph_best)
                    alph_best = a;
                    best = b;
                end
            end
        end
    else
        best = root;
        alph_best = alph(root,p);
        
        if(~isLeaf(root.right))
            [b, a] = BestToPrune(root.right, p);
            if(a < alph_best)
                alph_best = a;
                best = b;
            end
        end
    end
end

