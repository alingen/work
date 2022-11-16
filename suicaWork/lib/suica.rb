class Suica
  attr_accessor :money, :users

  def initialize(money:, user:)
    @user = user
    @money = money
  end

  def charge
    print '金額入力してください > '
    num = gets.to_i
    puts '100円以上の金額を入力してください' unless num >= 100
    @money += num
    puts "チャージ金額#{@money}"
  end

  def select_item(items)
    print '購入するドリンクの番号を入力してください > '
    buy_num = gets.to_i
    items[buy_num - 1]
  end

  def pay(item)
    if @money > item.price
      @money -= item.price
    else
      puts 'お金がたりません'
      false
    end
  end
end
