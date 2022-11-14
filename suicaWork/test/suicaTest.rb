require 'minitest/autorun'
require '../lib/suica'
require '../lib/users'
require '../lib/vend'
require '../lib/items'

class SuicaTest < Minitest::Test
  def test_suica_buy_cola
    users = []
    users << User.new(age: 28, gender: '男性')
    suica = Suica.new(money:1000, users: users)
    items = []
    items << Item.new(name: 'コーラ', price: 120, stock: 5, id: 1)
    items << Item.new(name: 'レッドブル', price: 200, stock: 5, id:2)
    items << Item.new(name: '水', price: 100, stock: 5, id:3)
    vend = Vend.new(items: items, sales: 0)
    user_now = users[0]
    count = 0
    history = []
    item = items[0]
    assert vend.sell(suica, item, count, history, user_now)
  end

  def test_suica_buy_redbull
    users = []
    users << User.new(age: 28, gender: '男性')
    suica = Suica.new(money:1000, users: users)
    items = []
    items << Item.new(name: 'コーラ', price: 120, stock: 5, id: 1)
    items << Item.new(name: 'レッドブル', price: 200, stock: 5, id:2)
    items << Item.new(name: '水', price: 100, stock: 5, id:3)
    vend = Vend.new(items: items, sales: 0)
    user_now = users[0]
    count = 0
    history = []
    item = items[1]
    assert vend.sell(suica, item, count, history, user_now)
  end

  def test_suica_no_money
    users = []
    users << User.new(age: 28, gender: '男性')
    suica = Suica.new(money:100, users: users)
    items = []
    items << Item.new(name: 'コーラ', price: 120, stock: 5, id: 1)
    items << Item.new(name: 'レッドブル', price: 200, stock: 5, id:2)
    items << Item.new(name: '水', price: 100, stock: 5, id:3)
    vend = Vend.new(items: items, sales: 0)
    user_now = users[0]
    count = 0
    history = []
    item = items[0]
    refute vend.sell(suica, item, count, history, user_now)
  end

  def test_suica_no_stockentory
    users = []
    users << User.new(age: 28, gender: '男性')
    suica = Suica.new(money:1000, users: users)
    items = []
    items << Item.new(name: 'コーラ', price: 120, stock: 0, id: 1)
    items << Item.new(name: 'レッドブル', price: 200, stock: 5, id:2)
    items << Item.new(name: '水', price: 100, stock: 5, id:3)
    vend = Vend.new(items: items, sales: 0)
    user_now = users[0]
    count = 0
    history = []
    item = items[0]
    refute vend.sell(suica, item, count, history, user_now)
  end

end
