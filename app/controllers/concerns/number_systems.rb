module NumberSystems
  BITS_DISPLAY = ['0', '1']
  BASE_DISPLAY = ('0'..'9').to_a + ('A'..'F').to_a
  BASE_TO_N = BASE_DISPLAY.map.with_index{ |base_n, n| [base_n, n] }.reduce({}) do |hash, pair|
    hash[pair[0]] = pair[1]
    hash
  end

  def NumberSystems.n_to_bit(n, leading_zeros = 4)
    output = ''
    until n == 0
      bit = n % 2
      output = BITS_DISPLAY[bit] + output
      n /= 2
    end
    output.rjust(leading_zeros, '0')
  end

  def NumberSystems.n_to_base(n:, base:, min_length: 1)
    output = ''
    until n == 0
      bit = n % base
      output = BASE_DISPLAY[bit] + output
      n /= base
    end
    output.rjust(min_length, '0')
  end

  def NumberSystems.base_to_n(n_string:, base:)
    n_string.chars.reverse.map.with_index{ |c, offset| BASE_TO_N[c] * base ** offset }.reduce(:+)
  end

  def NumberSystems.create_table(base: 2, row_count: 16, min_length: 4)
    rows = []
    row_count.times do |a|
      row = []
      base.times do |b|
        #row << n_to_bit(a * base + b)
        n = a * base + b
        row << {
          n: n,
          text: n_to_base(n: n, base: base, min_length: min_length)
        }
      end
      rows << row
    end
    rows
  end
end