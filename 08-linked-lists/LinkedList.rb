# Make 'pry' available in order to use 'binding.pry'
require 'pry'

# - Write out/explain steps for the solution before coding 
# - Code out solution 
# - Run test case examples 
# - Give Big-O

# Task => Retrieve the third item in a collection
# Array => myArray[2] => O(1)
# LinkedList => LinkedList.each => O(n)

# Task => Add a new item to the beginning of a collection
# Array => myArray.push("new item") => O(n) 
    # [1,2,3,4,5]
    #  0 1 2 3 4
    # [0,1,2,3,4,5]
    #  0 1 2 3 4 5
# LinkedList => LinkedList.add_to_start(newNode) => O(1)

# Implement a custom LinkedList Class with:

    # 1. A method (add_to_start) that adds a new Node to the beginning of each LinkedList.
        # Big-O Time Complexity: O(1)
    # 2. A method (add_to_end) that adds a new Node to the end of each LinkedList.
        # Big-O Time Complexity: O(n)
    # 3. A method (print_all) that prints the value of every Node.
        # Big-O Time Complexity: O(n)

class Node
    # Set attr_accessor for :value, :next_node
    attr_accessor :value, :next_node

    # Define 'initialize' to accept 'value' and 'next_node' (default nil)
    def initialize(value, next_node=nil)
        @value=value
        @next_node = next_node
    end
end

class LinkedList
    # Set attr_accessor for :head
    attr_accessor :head

    # Define 'initialize' to set @head = nil
    def initialize
        @head = nil
    end

    # Define 'add_to_start' to add a new Node to the beginning of each LinkedList.
    # add_to_start(3)
    # Runtime (Time) Complexity => O(1)
    def add_to_start(value)
        # Create a new 'Node' using passed 'value' argument
        new_node = Node.new(value)

        # Set 'new_node.next_node' equal to '@head'
        new_node.next_node = @head

        # Set '@head' equal to 'new_node' and return
        @head = new_node
    end

    # Define 'add_to_end' to add a new Node to the end of each LinkedList.
    # add_to_end(3)
    # Runtime (Time) Complexity => O(n)
    def add_to_end(value)
        # Create a new 'Node' using passed 'value' argument
        new_node = Node.new(value)

        # Assign 'current' to equal 'self.head'
        current = self.head

        # While 'current.next_node' is not falsey, set 'current' equal to 'current.next_node'
        while current.next_node
            current = current.next_node
        end

        # Otherwise, set 'current.next_node' equal to 'new_node'
        current.next_node = new_node
    end
    

    # Define 'print_all' to output the value of every Node
    # Runtime (Time) Complexity => O(n)
    def print_all
        # Assign 'current' to equal 'self.head'
        current = self.head

        # While 'current' is not falsey, output current.value before setting 'current' equal to 'current.next_node'
        while current
            # output current.value
            puts "Value is: #{current.value}"

            # set 'current' equal to 'current.next_node'
            current = current.next_node
        end
    end
end

# binding.pry