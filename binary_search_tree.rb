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

  def insert(value, root = @root)
    return Node.new(value) if root.nil?
    return root if root.data == value

    if root.data < value
      root.right = insert(value, root.right)
    else
      root.left = insert(value, root.left)
    end
    root
  end

  def min_value(node)
    minv = node.data
    until node.left.nil?
      minv = node.left.data
      node = node.left
    end
    minv
  end

  def delete(value, root = @root)
    return root if root.nil?

    if value < root.data
      root.left = delete(value, root.left)
    elsif value > root.data
      root.right = delete(value, root.right)
    else
      if root.left.nil?
        return root.right
      elsif root.right.nil?
        return root.right
      end

      root.data = min_value(root.right)
      root.right = delete(root.data, root.right)
    end
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
