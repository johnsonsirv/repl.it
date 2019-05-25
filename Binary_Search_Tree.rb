# nodes in the tree
class Node
    attr_accessor :value, :left, :right
    def initialize(value, left = nil, right = nil)
        @value = value
    end
end

class BinarySearchTree
    def initialize
        @root = nil
    end

    #insert method for BST (sorted data)
    def insert(value)
        @newNode = Node.new(value)
        if @root.nil?
            @root = @newNode
            return
        else
            @current = @root
            while true
                if value < @current.value
                    if @current.left.nil?
                        @current.left = @newNode
                        return
                    else
                        @current = @current.left
                    end
                elsif value > @current.value
                    if @current.right.nil?
                        @current.right = @newNode
                        return
                    else
                        @current = @current.right
                    end
                end
            end
        end
            
    end

    def pre_order
        @result = []
        @current = @root
        def traverse(node)
            @result.push(node.value)
            traverse(node.left) if node.left
            traverse(node.right) if node.right
        end
        traverse(@current)
        return @result.join(' ')
    end
end


tree = BinarySearchTree.new
tree.insert(5)
tree.insert(3)
tree.insert(7)
tree.insert(1)
tree.insert(2)
tree.insert(6)
tree.insert(8)
# tree.insert(4)
# tree.insert(7)
# tree.insert(13)

print tree.pre_order
# puts tree.pre_order(tree)
# # => "8 3 1 6 4 7 10 14 13"

#[5, 3, 7, 1, 2, 6, 8]
#=>"5 3 1 2 7 6 8"

#[50, 25, 75, 15, 21, 62, 91]
#=>"50 25 15 21 75 62 91"