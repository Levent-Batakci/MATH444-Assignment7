classdef Node < handle
    %LTREE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        left
        right
        c        
        split_index
        split_direction
        rows
        cols
        vals
        
        rmax
        rmin
        cmax
        cmin
    end
    
    methods
        function obj = Node(rows, cols, vals, a, b, o, d)
            obj.rows = rows;
            obj.cols = cols;
            obj.vals = vals;
            obj.c = mean(vals,1);
            
            obj.rmax = a;
            obj.rmin = b;
            obj.cmax = o;
            obj.cmin = d;
        end
        
        function node = splitNode(node)
            [s, dir] = OptimalSplit(node);
            node.split_index = s;
            node.split_direction = dir;
            
            a = node.rmax;
            b = node.rmin;
            o = node.cmax;
            d = node.cmin;
            
            if(dir == 1) %horizontal
                L = (node.rows <= s);
                R = (node.rows > s);
                
                
                node.left = Node(node.rows(L), node.cols(L), node.vals(L,:), s, b, o, d);
                node.right = Node(node.rows(R), node.cols(R), node.vals(R,:), a, s+1, o, d);
            else
                L = (node.cols <= s);
                R = (node.cols > s);
                
                
                node.left = Node(node.rows(L), node.cols(L), node.vals(L,:), a, b, s, d);
                node.right = Node(node.rows(R), node.cols(R), node.vals(R,:), a, b, o, s+1);
            end
        end
        
        function e = getErr(node)
            e = sum(norm(node.vals-node.c, 2));
        end
        
        function e = splitErr(node, s, dir)
            if(dir == 1) %horizontal
                L = (node.rows <= s);
                L = node.vals(L, :);
                c1 = mean(L,1); 
                e1 = sum(vecnorm(L - c1,2,2));
                
                R = (node.rows > s);
                R = node.vals(R, :);
                c2 = mean(R,1); 
                e2 = sum(vecnorm(R - c2,2,2));
                
                e = e1+e2;
            else
                L = (node.cols <= s);
                L = node.vals(L, :);
                c1 = mean(L,1); 
                e1 = sum(vecnorm(L - c1,2,2));
                
                R = (node.cols > s);
                R = node.vals(R, :);
                c2 = mean(R,1); 
                e2 = sum(vecnorm(R - c2,2,2));
                
                e = e1+e2;
            end
        end
        
        function rgb = color(node, row, col)
            if(numel(node.split_index) == 0)
                rgb = node.c;
            elseif(node.split_direction == 1)
                 if(row <= node.split_index)
                     rgb = color(node.left, row, col);
                 else
                     rgb = color(node.right, row, col);
                 end
            else
                 if(col <= node.split_index)
                     rgb = color(node.left, row, col);
                 else
                     rgb = color(node.right, row, col);
                 end
            end
        end
        
        function r = rowRange(node)
            r = node.rmin:node.rmax;
        end
        
        function c = colRange(node)
            c = node.cmin:node.cmax;
        end
        
        function leaves = get_leaves(node)
            if(numel(node.split_index) == 0)
                leaves(1) = node;
            else
                leaves = [get_leaves(node.left) get_leaves(node.right)];
            end
        end
    end
end

