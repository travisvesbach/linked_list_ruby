class LinkedList

	attr_accessor :head, :tail

	def initialize
		@head = nil
		@tail = nil
	end


	#adds a new node to the end of the list
	def append (data)
		new_node = Node.new(data)
		if @head == nil
			@head = new_node
		else
			current = @head
			until current.next_node == nil
				current = current.next_node
			end
			current.next_node = new_node
		end
		puts "( #{data} ) has been appended to the list."
	end

	#add a new node to the start of the list
	def prepend(data)
		new_node = Node.new(data, @head)
		@head = new_node
		puts "( #{data} ) has been prepended to the list."
	end

	#returns the total number of nodes in the list
	def size
		count = 0
		current = @head
		until current == nil
			count += 1
			current = current.next_node
		end
		count
	end

	#returns the first node in the list
	def head
		@head
	end

	#returns the last node in the list
	def tail
		current = @head
		until current.next_node == nil
			current = current.next_node
		end
		current
	end

	#returns the node at the given index
	def at(index)
		counter = 0
		current = @head
		until counter == index
			current = current.next_node
			counter += 1
		end
		current
	end

	#removes the last element from the list
	def pop
		current = @head
		if current.next_node == nil
			@head = nil 
		else
			until current.next_node.next_node == nil
				current = current.next_node
			end
			puts "Popping ( #{current.next_node.value} ) from the list."
			current.next_node = nil
		end
	end

	#returns true if the passed in value is in the list and otherwise returns false
	def contains?(value)
		current = @head
		until current == nil
			return true if current.value == value
			current = current.next_node
		end
		false
	end

	#returns the index of the node containing data, or nil if not found
	def find(data)
		counter = 0
		current = @head
		until current == nil
			return counter if current.value == data
			current = current.next_node
			counter += 1
		end
		return nil
	end

	#represent the LinkedList objects as strings, so they can be printed out and previewed in the console.  
	#the format should be # => (data) -> (data) -> (data) -> nil
	def to_s
		current = @head
		until current == nil
			print "( #{current.value} )"
			print " -> " if current.next_node != nil
			current = current.next_node
		end
		print " -> nil"
		puts ""
	end

	#inserts a new node at the given index and shifts the rest back.
	def insert_at(data = nil, index)
		counter = 0
		current = @head

		until counter == index - 1
			current = current.next_node
			counter += 1
		end
		puts "inserting ( #{data} ) at index #{index} to the list."
		new_node = Node.new(data, current.next_node)
		current.next_node = new_node

	end

	#removes a node from the given index and shifts the rest forward.
	def remove_at(index)
		counter = 0
		current = @head
		until counter == index - 1
			current = current.next_node
			counter += 1
		end
		puts "Removing ( #{current.next_node.value} ) at index #{index} from the list."
		current.next_node = current.next_node.next_node
	end

end

class Node

	attr_accessor :value, :next_node

	def initialize(value = nil, next_node = nil)
		@value = value
		@next_node = next_node
	end

end

list = LinkedList.new

list.append(86)
list.append(75)
list.append(53)
list.append(34)
list.append(8)

list.to_s

list.prepend(9999)
list.to_s
puts "The current list size is #{list.size}"


puts list.find(8)

puts list.contains?(75)

list.pop

list.to_s

list.insert_at(32, 2)

list.to_s

list.remove_at(3)

list.to_s