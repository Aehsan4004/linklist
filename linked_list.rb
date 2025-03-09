# linked_list.rb

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node while current.next_node
      current.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  def head
    @head
  end

  def tail
    return nil if @head.nil?
    current = @head
    current = current.next_node while current.next_node
    current
  end

  def at(index)
    return nil if index < 0 || @head.nil?
    current = @head
    index.times do
      return nil unless current
      current = current.next_node
    end
    current
  end

  def pop
    return nil if @head.nil?
    if @head.next_node.nil?
      @head = nil
      return
    end
    current = @head
    current = current.next_node while current.next_node&.next_node
    current.next_node = nil
  end

  def contains?(value)
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    index = 0
    current = @head
    while current
      return index if current.value == value
      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    return "nil" if @head.nil?
    elements = []
    current = @head
    while current
      elements << "( #{current.value} )"
      current = current.next_node
    end
    elements.join(" -> ") + " -> nil"
  end

  def insert_at(value, index)
    return prepend(value) if index == 0
    return nil if index < 0 || @head.nil?
    new_node = Node.new(value)
    current = @head
    (index - 1).times do
      return nil unless current
      current = current.next_node
    end
    return nil unless current
    new_node.next_node = current.next_node
    current.next_node = new_node
  end

  def remove_at(index)
    return nil if @head.nil? || index < 0
    return @head = @head.next_node if index == 0
    current = @head
    (index - 1).times do
      return nil unless current
      current = current.next_node
    end
    return nil unless current && current.next_node
    current.next_node = current.next_node.next_node
  end
end