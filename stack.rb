# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!

class Stack
	attr_reader :length
	attr_accessor :tail
	def initialize ()
		@length = 0
		@tail = nil
	end

	def push(value)
		new_node = Node.new(value)
    @length += 1
    if @tail.nil?
      @tail = new_node
    else
      new_node.previous = @tail
      @tail = new_node
    end
	end

	 def pop
    if @tail.nil?
      return nil
    else
      popped_tail = @tail
      @tail = @tail.previous
      @length -= 1
      return popped_tail.value
    end
  end
end

# A simple Node class.  A LinkList will be composed of many
# nodes.
class Node
  attr_accessor :next, :previous, :value
  def initialize(value)
    @value = value
    @next = nil
    @previous = nil
  end
end
