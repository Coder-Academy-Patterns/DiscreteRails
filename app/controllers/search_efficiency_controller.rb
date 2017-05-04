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
  end
end
