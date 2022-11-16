class Item
  attr_reader :name, :price, :id
  attr_accessor :stock

  def initialize(name:, price:, stock:, id:)
    @name = name
    @price = price
    @stock = stock
    @id = id
  end

  def self.display(items)
    puts ''
    puts 'ドリンクをお選びください'
    puts '---------------'
    items.each do |item|
      puts "#{item.id}: #{item.name} #{item.price}円 #{item.stock}本"
    end
    puts '---------------'
  end
end
