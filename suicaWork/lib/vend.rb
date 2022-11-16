class Vend
  attr_accessor :items, :item, :history, :finish_num, :sales

  def initialize(items:, sales:, history:)
    @items = items
    @sales = sales
    @history = history
  end

  def request(item)
    if item.stock > 0
      true
    elsif item.stock <= 0
      puts '在庫がありません'
      false
      nil
    end
  end

  def sell(suica_now, item, count, user_now)
    time_at = Time.now
    item.stock = item.stock - 1

    puts "#{item.price}円で#{item.name}を買いました"
    puts "suica残高は#{suica_now.money}円です"
    self.sales += item.price
    puts "売上#{self.sales}円です"
    history.push(id: count, time_at: time_at, age: user_now.age, gender: user_now.gender, item: item.id)
    true
  end

  def show_history
    puts 'どのドリンクの履歴をみますか？'
    print '1:コーラ 2:レッドブル 3:水 > '
    choice_num = gets.to_i
    history.filter_map { |num| puts "#{num[:age]}歳 #{num[:gender]} " if num[:item] == choice_num }
  end

  def finish
    puts ''
    puts 'どの操作をしますか？'
    print '1:もう一度買う 2:履歴を見る 3:やめる > '
    finish_num = gets.to_i
  end

  def availabale_item
    puts '購入可能なドリンク'
    items.each do |n|
      puts n.name if n.stock != 0
    end
  end
end
