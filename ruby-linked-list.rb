require 'pry-byebug'

#Node class
class Node
  attr_accessor :value, :next_node

  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node    
  end

end

#Linked List Class
class LinkedList
  attr_accessor :my_node, :head_node

  def initialize(value=nil, next_node=nil)
    @my_node = Node.new(value, next_node)
    @head_node = @my_node
  end
  
  #append a new node to the end of the list, uses recursion to find the end of the list first
  def append(value)
    curr_node = @head_node
    until curr_node.next_node == nil do
      curr_node = curr_node.next_node
    end
    @my_node = Node.new(value)
    curr_node.next_node = @my_node
  end
  
  #prepends a new node to the beginning of the list and takes over the head node title
  def prepend(value)
    new_node = Node.new(value, @head_node)  
    @head_node = new_node 
  end

  #size returns the number of nodes in the list
  def size
    curr_node = @head_node
    counter = 1
    until curr_node.next_node == nil do
      counter+=1
      curr_node = curr_node.next_node
    end
    return counter
  end

  #head returns the first node in the list
  def head
    return @head_node
  end

  #tail returns the last node in the list
  def tail
    curr_node = @head_node
    until curr_node.next_node == nil do
      curr_node = curr_node.next_node
    end
    return curr_node
  end

  #at returns the node at a give index
  def at(index)
    curr_node = @head_node
    i = 0
    until i == index do
      curr_node = curr_node.next_node
      i+=1
    end
    return curr_node
  end

  #pop removes the last element from the list
  def pop
    curr_node = @head_node
    until curr_node.next_node == nil do
      prev_node = curr_node
      curr_node = curr_node.next_node
    end
    prev_node.next_node = nil
  end

  #contains?(value) returns true if the passed in value is in the list and otherwise returns false
  def contains?(value)
    result = false
    curr_node = @head_node
    until curr_node.next_node == nil do
      result = true if curr_node.value == value
      curr_node =  curr_node.next_node
    end
    return result
  end

  #find(value) returns the index of the node containing value, or nil if not found
  def find(value)
    i = 0
    curr_node = @head_node
    until curr_node.next_node == nil do
      return i if curr_node.value == value
      curr_node = curr_node.next_node
      i+=1
    end
  end

  #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console
  def to_s
    curr_node = @head_node
    until curr_node.next_node == nil do
      p "( #{curr_node.value} ) ->"
      curr_node = curr_node.next_node
    end
    p "( nil )"
  end

end

binding-pry


