require 'binary_search_tree'

class TreeController < ApplicationController
  def index
    @b = BinarySearchTree.new
    #items = params.fetch(:items, '').split('~')
    #@b.insert items
    ("a".."z").each do |c|
      @b.insert c, c
    end

  end
end
