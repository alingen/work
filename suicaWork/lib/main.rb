require './suica'
require './items'
require './vend'
require './users'
require 'date'

users = []

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

users << User.new(age: user_age, gender: user_gender)

# user.sign_up

suica = Suica.new(money: 0, users: users)
items = []
items << Item.new(name: 'コーラ', price: 120, inv: 5, id: 1)
items << Item.new(name: 'レッドブル', price: 200, inv: 5, id:2)
items << Item.new(name: '水', price: 100, inv: 5, id:3)
vend = Vend.new(items: items, sales: 0)

user_now = suica.user_select(suica.users)

# チャージ画面表示
while suica.money < 100
  suica.charge
end



count = 0
history = []
loop do
# 購入画面表示
  vend.display
  item = suica.buy(vend.items)
  count += 1
  vend.sell(suica, item, count, history, user_now)
  # 購入可能なドリンクのリストを表示させたいとき
  # vend.availabale_item(items)

  finish_num = 1
  x = vend.finish(finish_num)

  if x == 1
    next
  elsif x == 2
    #  履歴の表示
    vend.show_history(items, item, history)
    exit
  end

  break if x == 3
  
end


