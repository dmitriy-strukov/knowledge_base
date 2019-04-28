class BinaryTree
    attr_reader :root_node, :node_class

    def initialize(element, node_class=BinaryTreeNode)
        @root_node = node_class.new(element)
        @node_class = node_class
    end

    def insert(value)
        current_node = root_node
        inserted = false

        while inserted == false
            if current_node.left.nil? && current_node.value > value
                current_node.left = node_class.new(value)
                inserted = true
            end

            if current_node.right.nil? && current_node.value <= value
                current_node.right = node_class.new(value)
                inserted = true
            end

            if value > current_node.value
                current_node = current_node.right
            elsif value < current_node.value
                current_node = current_node.left
            end
        end
    end
end

class BinaryTreeNode
    attr_reader :value
    attr_accessor :left, :right

    def initialize(value, left=nil, right=nil)
        @value = value
  
        @left  = left
        @right = right
    end
end