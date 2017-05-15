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
    @step = @query.present? ? params.fetch(:step, '0').to_i : 0
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

    @hash_size = 31
    @items_hash_array = Array.new(@hash_size) { [] }
    ITEMS_ARRAY.each do |item|
      hash_value = item.djb2_hash 
      @items_hash_array[hash_value % @hash_size] << item
    end

    if @step >= 1
      @items_hash_found_offset = @query.djb2_hash % @hash_size
    end
  end
end
