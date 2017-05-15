require 'binary_search_tree'

class TreeController < ApplicationController
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
    @b = BinarySearchTree.new
    ITEMS_ARRAY.each do |item|
      @b.insert item, item
    end
  end
end
