class SearchEfficiencyController < ApplicationController
  ITEMS_ARRAY = %Q(
Deer
Goat
Jaguar
Panther
Chicken
Salamander
Dog
Civet
Lemur
Ermine
Bear
Lizard
Hamster
Guanaco
Hippopotamus
Capybara
Ground hog
Mule
Octopus
Bumble bee
).lines.map(&:strip).select(&:present?)

  def index
    @query = params.fetch(:q, '')
    @step = params.fetch(:step, '1').to_i
    @items = ITEMS_ARRAY
    @items_sorted = ITEMS_ARRAY.sort

    # Binary search
    low = 0
    high = @items_sorted.length
    @binary_search_step_result = []
    @step.times do
      mid = low + ((high - low) / 2)
      @binary_search_step_result << mid
      direction = @items_sorted[mid] <=> @query
      if direction == 0
        break
      elsif direction < 0
        low = mid + 1
      else # direction > 0
        high = mid
      end
    end

    @b = BinarySearchTree.new
    ITEMS_ARRAY.each do |item|
      @b.insert item, item
    end

    @binary_tree_step_nodes = []
    @binary_tree_search_steps = []
    # @binary_tree_found_node = @b.find(@query)
    # node = @binary_tree_found_node
    # while node
    #   @binary_tree_step_nodes << node
    #   node = node.parent
    # end
    # @binary_tree_step_nodes.reverse!

    node = @b.root
    #while node.present?
    @step.times do
      break if node.nil?
      @binary_tree_step_nodes << node
      case @query <=> node.key
      when -1
        @binary_tree_search_steps << -1
        node = node.left
      when 1
        @binary_tree_search_steps << 1
        node = node.right
      else
        @binary_tree_search_steps << 0
        node = nil
      end
    end
  end
end
