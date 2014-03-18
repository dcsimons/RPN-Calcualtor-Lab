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
  	new_stack = Stack.new
  	while rpn_list.length > 0
  		char = rpn_list.shift
  		if RPNCalculator.is_number(char)
  			new_stack.push(char)
  		elsif RPNCalculator.is_operation(char)
  			num1 = new_stack.pop
  			num2 = new_stack.pop
  			num3 = num2.to_f.send(char, num1.to_f)
  			new_stack.push(num3)
  		end
  		count += 1
  	end
  	return new_stack.pop.to_f
  end

  def self.is_operation(operation)
  	if operation.match(/[\+\-\*\/\^]/)
  		return true
  	else
  		return false
  	end
  end
  
  def self.is_number(num)
  	if num.match(/\d/)
  		return true
  	else
  		return false
  	end
  end
end
