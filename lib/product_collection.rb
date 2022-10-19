class ProductCollection
  PRODYCT_TYPES = {
    film: {dir: "films", class: Movie},
    book: {dir: "books", class: Book},
    disk: {dir: "disks", class: Disk}
  }

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []

    PRODYCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir["#{dir_path}/#{product_dir}/*.txt"].each do |path|
        products << product_class.from_file(path)
      end
    end
    self.new(products)
  end

  def to_a
    @products
  end

  def to_s
    @products.map.with_index(1) do |product, index|
      "#{index}. #{product}"
    end.join("\n")
  end

  def remove_out_of_stock!
    @products.select! { |product| product.amount > 0 }
  end

  def product_by_index(product_index)
    @products[product_index - 1]
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! { |product| product.to_s}
    when :price
      @products.sort_by! { |product| product.price}
    when :amount
      @products.sort_by! { |product| product.amount}
    end

    @products.reverse! if params[:order] == :asc

    self
  end
end
