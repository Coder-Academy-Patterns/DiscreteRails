require 'prime'

class SetsController < ApplicationController
  ALL_NUMBERS = Set.new 1..20
  FIRST_10_NUMBERS = Set.new ALL_NUMBERS.first(10).map(&:to_s)
  EVEN_NUMBERS = Set.new ALL_NUMBERS.select(&:even?).map(&:to_s)
  ODD_NUMBERS = Set.new ALL_NUMBERS.select(&:odd?).map(&:to_s)
  PRIME_NUMBERS = Set.new Prime.each(20).map(&:to_s)

  def index
    @items = Set.new params.fetch(:items, '').split('~')
    @all_numbers = ALL_NUMBERS
    @even_numbers = EVEN_NUMBERS
    @odd_numbers = ODD_NUMBERS
    @first_10_numbers = FIRST_10_NUMBERS
    @prime_numbers = PRIME_NUMBERS
  end
end
