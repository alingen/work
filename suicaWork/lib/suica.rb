class Suica

  attr_accessor :money, :users

  def initialize(money:, users:)
    @users = users
    @money = money
  end

  def charge
		print '金額入力してください > '
		num = gets.to_i
    unless num >= 100
      puts '100円以上の金額を入力してください'
    end
		@money = @money + num
		puts "チャージ金額#{@money}"
	end

  def buy(items)
    print '購入するドリンクの番号を入力してください > '
    buy_num = gets.to_i
    items[buy_num - 1]
  end

  def user_select(users)
    puts '---------------'
    @users.each_with_index do |n, i|
      puts "#{i+1}: #{n.age}歳 #{n.gender} "
    end
    puts '---------------'
    print '何番目のユーザーで購入しますか？ > '
    num = gets.to_i
    users[num - 1] 
  end

end