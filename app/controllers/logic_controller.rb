class LogicController < ApplicationController
  OPERATORS = [:and, :or, :xor]

  def perform_operator(a, b, operator)
    case operator
    when :and
      a && b
    when :or
      a || b
    when :xor
      a ^ b
    end
  end
  
  def index
    @pairs = [[true, true], [true, false], [false, true], [false, false]]
    @results = {}
    OPERATORS.each do |operator|
      @results[operator] = @pairs.map do |pair|
        perform_operator(pair.first, pair.second, operator)
      end
    end

    @binary_a = [true, true, false, true, false]
    @binary_b = [true, false, true, false, false]
    @binary_and = @binary_a.map.with_index do |a, index|
      b = @binary_b[index]
      a && b
    end
    @binary_or = @binary_a.map.with_index do |a, index|
      b = @binary_b[index]
      a || b
    end
    @binary_xor = @binary_a.map.with_index do |a, index|
      b = @binary_b[index]
      a ^ b
    end
  end
end
