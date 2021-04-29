function [s, dir] = OptimalSplit(node)

%s is the split index
%dir is the direction

s = node.rows(1);
eBest = -1;
dir = 1;

rs = unique(sort(node.rows))';
%horizontal split
for i = 1:size(rs,2)-1
    split = floor((rs(i)+rs(i+1))/2);
    e = splitErr(node, split, 1);
    if(eBest < 0 || eBest > e)
        s = split;
        eBest = e;
        dir = 1;
    end
end

cs = unique(sort(node.cols))';
%vertical split
for i = 1:size(cs,2)-1
    split = floor((cs(i)+cs(i+1))/2);
    e = splitErr(node, split, 2);
    if(eBest < 0 || eBest > e)
        s = split;
        eBest = e;
        dir = 2;
    end
end

end

