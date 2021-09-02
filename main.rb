# frozen_string_literal: true

require_relative 'binary_search_tree'

# arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
# p arr.uniq.sort
# tree = Tree.new(arr)
# tree.pretty_print
# tree.insert(6)
# tree.pretty_print

arr = [20, 30, 40, 50, 60, 70, 80]
tree = Tree.new(arr)
tree.pretty_print
puts 'delete 20'
tree.delete(20)
tree.pretty_print
puts 'delete 30'
tree.delete(30)
tree.pretty_print
puts 'delete 50'
tree.delete(50)
tree.pretty_print
