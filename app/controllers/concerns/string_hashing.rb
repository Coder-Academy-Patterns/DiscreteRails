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

  def sha256_digest
    sha256 = OpenSSL::Digest::SHA256.new
    sha256 << self
    sha256.hexdigest
  end
end