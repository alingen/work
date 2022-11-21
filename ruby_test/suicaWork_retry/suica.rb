class Suica

  attr_reader :money
  def initialize(money: 0)
    @money = money
  end

  def charge(value)
    if value < 100
      puts `100円以上チャージしてください`
      raise
    end
    @money += value
  end

  def pay(value)
  end


  private

  attr_writer :money

end
