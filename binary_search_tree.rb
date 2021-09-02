# frozen_string_literal: true

# Tree Node
class Node
  attr_accessor :data, :left, :right
  include Comparable
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

# Binary Seach Tree
class Tree
  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    arr = arr.uniq.sort
    return nil if arr.empty?

    mid = arr.size / 2
    n = Node.new(arr[mid])
    root = n
    n.left = build_tree(arr[0, mid])
    n.right = build_tree(arr[mid + 1..-1])
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
