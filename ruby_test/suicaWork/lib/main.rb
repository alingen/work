require './suica'
require './items'
require './vend'
require './users'
require 'date'

users = []
suicas = []

# ユーザー登録
loop do
  print '年齢を数字で入力してください：'
  user_age = gets.to_i
  puts '性別を数字で選択してください'
  print '1:男性 2:女性 > '
  n = gets.to_i
  if n == 1
    user_gender = '男性'
  elsif n == 2
    user_gender = '女性'
  end
  user = User.new(age: user_age, gender: user_gender)
  suica = Suica.new(money: 0, user: user)
  # チャージ画面表示
  suica.charge while suica.money < 100
  users << user
  suicas << suica

  puts 'どの操作をしますか？'
  print '1:別ユーザー登録 2:購入する > '
  a = gets.to_i
  next if a == 1
  break if a == 2
end

# ユーザー選択
puts '---------------'
users.each_with_index do |n, i|
  puts "#{i + 1}: #{n.age}歳 #{n.gender} "
end
puts '---------------'
print '何番目のユーザーで購入しますか？ > '
num = gets.to_i
suica_now = suicas[num - 1]
user_now = users[num - 1]

items = []
items << Item.new(name: 'コーラ', price: 120, stock: 5, id: 1)
items << Item.new(name: 'レッドブル', price: 200, stock: 5, id: 2)
items << Item.new(name: '水', price: 100, stock: 5, id: 3)
history = []
vend = Vend.new(items: items, sales: 0, history: history)

count = 0
loop do
  if count != 0
    puts '---------------'
    users.each_with_index do |n, i|
      puts "#{i + 1}: #{n.age}歳 #{n.gender} "
    end
    puts '---------------'
    print '何番目のユーザーで購入しますか？ > '

    num = gets.to_i
    suica_now = suicas[num - 1]
    user_now = users[num - 1]
  end

  # 購入画面表示
  Item.display(items)
  item = suica_now.select_item(vend.items)
  vend.request(item)
  next if item.stock <= 0

  count += 1
  suica_now.pay(item)
  next if suica_now.money <= 0

  vend.sell(suica_now, item, count, user_now)

  # 購入可能なドリンクのリストを表示させたいとき
  # vend.availabale_item
  loop do
    finish_num = 1
    x = vend.finish
    break if x == 1
      
     x == 2
      vend.show_history
    elsif x == 3
      exit
    

  end
end
