class Item

  attr_reader :name, :price, :id
  attr_accessor :inv

  def initialize(name:, price:, inv:, id:)
    @name = name
    @price = price
    @inv = inv
    @id = id
  end
end 