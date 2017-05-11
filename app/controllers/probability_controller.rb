class ProbabilityController < ApplicationController
  def index
    items = params.fetch(:q, '').split('~')

    @sets = items.map do |set_s|
      Set.new(set_s.chars)
    end

    @probabilities = @sets.map{ |set| Rational(set.count, 6) }
    @total_probability = @probabilities.reduce(&:*) #Rational(1, 12)

    # Always show one row
    @sets << Set.new if @sets.empty?
    # Show next row if choices have been made in the last
    @sets << Set.new unless @sets.last.empty?
  end
end
