module LogicHelper
  def short_name_for(bool)
    bool ? 'T' : 'F'
  end

  def binary_for(bool)
    bool ? '1' : '0'
  end

  def number_for_binary_sequence(values)
    result = 0
    values.reverse.each_with_index do |bool_value, index|
      value = bool_value ? 1 : 0
      result += value * (2 ** index)
    end
    result
  end
end
