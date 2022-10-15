require_relative "lib/product"
require_relative "lib/movie"
require_relative "lib/book"

leon = Movie.new(price: 290, amount: 4)

puts "Фильм Леон стоит #{leon.price} руб."

