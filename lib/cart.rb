class Cart
  def initialize
    @products = []
  end

  def total
    @products.sum(&:price)
  end

  def <<(new_product)
    @products << new_product
  end

  def to_s
    @products.tally.map.with_index(1) do |(product, amount), index|
      "#{index}. #{product} - #{amount} шт."
    end.join("\n")
  end
end
