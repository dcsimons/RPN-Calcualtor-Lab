# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!

class Stack
	attr_reader :length
	attr_accessor :list
	def initialize ()
		@list = List.new
		@length = @list.length
	end

	def push(value)
		@list.push(value)
		@length = @list.length
	end

	def pop
		popped_character = @list.pop
		@length = @list.length
		return popped_character
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

class List

  attr_reader :length
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  # Adds a new value to the end of the list.
  def push(value)
    new_node = Node.new(value)
    @length += 1
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.previous = @tail
      @tail.next = new_node
      @tail = new_node
    end
  end

  # Returns the value that is popped off
  # or nil if none exists
  def pop
    if @tail.nil?
      return nil
    elsif @tail == @head
      popped_tail = @tail
      @head = nil
      @tail = nil
      @length = 0
      return popped_tail.value
    else
      popped_tail = @tail
      @tail = @tail.previous
      @tail.next = nil
      @length -= 1
      return popped_tail.value
    end
  end

  def insert(index, value)
    count = 0
    node = @head
    while count < index - 1
      node = node.next
      count += 1
    end
    if node.nil?
      new_node = Node.new(value)
      @head = new_node
      @tail = new_node
      @length += 1
    else
      @length += 1
      new_node = Node.new(value)
      new_node.previous = node
      new_node.next = node.next
      node.next = new_node
    end
  end

  # Given an index, returns the value at that index
  def [](index)
    count = 0
    node = @head
    while count < index
      node = node.next
      count += 1
    end
    if node.nil?
      return nil
    else 
      return node.value
    end
  end

  # Sets a value at the given index.  Returns the value that
  # was assigned
  def []=(index, value)
    count = 0
    node = @head
    while count < index
      node = node.next
      count += 1
    end
    if node.nil?
      return nil
    else
      node.value = value
      return node.value
    end
  end

  # Returns the first value that was removed from the list and
  # shifts all items down by 1
  def shift
    if @head == @tail
      node = @head
      @head = nil
      @tail = nil
      @length -= 1
      return node.value
    elsif @length > 1
      old_head = @head
      @head = @head.next
      @length -= 1
      return old_head.value
    else
      return nil
    end
  end

  # Adds a new value to the front of the list
  def unshift(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
      @length += 1
    else
      new_node.next = @head
      @head.previous = new_node
      @head = new_node
      @length += 1
    end
  end

  def first
    if @head.nil?
      return nil
    else
      return @head.value
    end
  end

  def last
    if @tail.nil?
      return nil
    else
      return @tail.value
    end
  end

end

