class LinkedList
  attr_accessor :head, :tail, :size
  def initialize
    @head = Node.new
    @tail = @head.next_node
    @size = 0
  end

  def traverse_until(value)
    begin
      node = @head
      if value == nil
        node = node.next_node until node.next_node == value
      else
        node = node.next_node until node.next_node.value == value
      end
      return node
    rescue
      return nil
    end
  end

  def append(value)
    if @size == 0
      new_node = Node.new(value, @tail)
      @head.next_node = new_node
    else
      node = traverse_until(nil)
      new_node = Node.new(value, @tail)
      node.next_node = new_node
    end
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value, @head.next_node)
    @head.next_node = new_node
    @size += 1
  end

  def at(index)
    node = @head.next_node
    index.times do
      node = node.next_node
    end
    node
  end

  def pop
    node = traverse_until(traverse_until(nil).value)
    node.next_node = @tail
    @size -= 1
  end

  def contains?(value)
    return true if traverse_until(value)
    return false
  end

  def find(value)
    if contains?(value) == true
      index = 0
      exit_cond = false
      until exit_cond
        if at(index).value == value
          exit_cond = true
        else
          index += 1
        end
      end
      return index
    else
      return "#{value} not found"
    end
  end

  def insert_at(value, index)
    if index == 0
      append(value)
    else
      node_before = at(index - 1)
      node_after = at(index)
      new_node = Node.new(value, node_after)
      node_before.next_node = new_node
      @size += 1
    end
  end

  def remove_at(index)
    if index == @size - 1
      pop
    else
      node_before = at(index - 1)
      node_after = at(index + 1)
      node_before.next_node = node_after
      @size -= 1
    end

  end

  def to_s
    str = ''
    node = @head.next_node
    until node == @tail
      str += "( #{node.value} ) -> "
      node = node.next_node
    end
    str += 'nil'
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

#test script

linked_list = LinkedList.new
linked_list.append('ali')
linked_list.append('veli')
linked_list.prepend('mehmet')
linked_list.append('fatih')
puts linked_list
node = linked_list.head.next_node
until node == linked_list.tail
  puts "#{linked_list.find(node.value)} : #{node.value}"
  node = node.next_node
end
linked_list.insert_at('zeki', 1)
puts linked_list
node = linked_list.head.next_node
until node == linked_list.tail
  puts "#{linked_list.find(node.value)} : #{node.value}"
  node = node.next_node
end
linked_list.remove_at(3)
node = linked_list.head.next_node
until node == linked_list.tail
  puts "#{linked_list.find(node.value)} : #{node.value}"
  node = node.next_node
end



