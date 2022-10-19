require_relative "product"

class Disk < Product
  attr_accessor :title, :executor, :genre, :year

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
      title: lines[0],
      executor: lines[1],
      genre: lines[2],
      year: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
      )
  end

  def initialize(params)
    super

    @title = params[:title]
    @executor = params[:executor]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом #{@title} - «#{@genre}», #{@executor}, #{@year}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @executor = params[:executor] if params[:executor]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end
end
