require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
  	new_list = List.new
  	string_arr = rpn_string.split(" ")
  	string_arr.each do |x|
  		new_list.push(x)
  	end
  	return new_list
  end

  def self.evaluate(rpn_list)
  end

  def self.is_operation(operation)
  end
  
  def self.is_number(num)
  end
end
