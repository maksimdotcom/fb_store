class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price].to_i
    @amount = params[:amount].to_i
  end


  def to_s
    "#{@price} руб. (осталось #{@amount})"
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end


  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end
end

