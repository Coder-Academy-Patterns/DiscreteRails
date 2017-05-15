class String
  def first_char_hash
    chars.first.ord
  end

  def xor_hash
    each_char.map(&:ord).reduce(0, :^)
  end

  def djb2_hash
    each_char.map(&:ord).reduce(5381) { |result, c| result * 33 + c }
  end
end