# frozen_string_literal: true

require_relative 'binary_search_tree'

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
p arr.uniq.sort
tree = Tree.new(arr)
tree.pretty_print
