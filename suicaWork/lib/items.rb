class Item

  attr_reader :name, :price, :id
  attr_accessor :stock

  def initialize(name:, price:, stock:, id:)
    @name = name
    @price = price
    @stock = stock
    @id = id
  end
end 
