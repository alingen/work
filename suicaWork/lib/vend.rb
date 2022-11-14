class Vend
  attr_accessor :items, :item, :history, :finish_num, :sales

  def initialize(items:, sales:)
    @items = items
    @sales = sales
    @history = history
    
  end

  def display
    puts ""
    puts 'ドリンクをお選びください'
    puts '---------------'
    @items.each do |item|
      puts "#{item.id}: #{item.name} #{item.price}円 #{item.inv}本"
    end
    puts '---------------'
  end

  def sell(suica, item, count, history, user_now)
    time_at = Time.now
    item.inv = item.inv - 1
    suica.money = suica.money - item.price
    if item.inv < 0
      puts "在庫がありません"
      false
      return
    elsif suica.money < 0
      puts "お金が足りません"
      false
      return
    end
    puts "#{item.price}円で#{item.name}を買いました"
    puts "残高#{suica.money}円"
    @sales = @sales + item.price
    # puts "売上は#{@sales}です"
    history.push(id:count, time_at:time_at, age:user_now.age, gender:user_now.gender, item:item.id)
    true
  end

  def show_history(items, item, history)
    puts 'どのドリンクの履歴をみますか？'
    print '1:コーラ 2:レッドブル 3:水 > '
    choice_num = gets.to_i
    history.filter_map { |num| puts "#{num[:age]}歳 #{num[:gender]} " if num[:item] == choice_num}
    
  end

  def finish(finish_num)
    puts ''
    puts "どの操作をしますか？"
    print "1:もう一度買う 2:履歴を見る 3:やめる > "
    finish_num = gets.to_i
  end

  def availabale_item(items)
    puts '購入可能なドリンク'
    items.each do |n|
      if n.inv != 0
        puts n.name
      end
    end
  end

end