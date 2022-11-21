require 'minitest/autorun'
require '../lib/suica'
require '../lib/users'
require '../lib/vend'
require '../lib/items'

class SuicaTest < Minitest::Test
  def test_suica_buy_cola
    users = []
    suicas = []
    user = User.new(age: 28, gender: '男性')
    suica = Suica.new(money: 1000, user: user)
    users << user
    suicas << suica
    items = []
    items << Item.new(name: 'コーラ', price: 120, stock: 5, id: 1)
    items << Item.new(name: 'レッドブル', price: 200, stock: 5, id: 2)
    items << Item.new(name: '水', price: 100, stock: 5, id: 3)
    history = []
    vend = Vend.new(items: items, sales: 0, history: history)
    user_now = users[0]
    suica_now = suicas[0]
    count = 0
    item = items[0]
    suica_now.pay(item)
    assert vend.sell(suica, item, count, user_now)
  end

  def test_suica_buy_redbull
    users = []
    suicas = []
    user = User.new(age: 28, gender: '男性')
    suica = Suica.new(money: 1000, user: user)
    users << user
    suicas << suica
    items = []
    items << Item.new(name: 'コーラ', price: 120, stock: 5, id: 1)
    items << Item.new(name: 'レッドブル', price: 200, stock: 5, id: 2)
    items << Item.new(name: '水', price: 100, stock: 5, id: 3)
    history = []
    vend = Vend.new(items: items, sales: 0, history: history)
    user_now = users[0]
    suica_now = suicas[0]
    count = 0
    item = items[1]
    suica_now.pay(item)
    assert vend.sell(suica, item, count, user_now)
  end

  def test_suica_no_money
    users = []
    suicas = []
    user = User.new(age: 28, gender: '男性')
    suica = Suica.new(money: 100, user: user)
    users << user
    suicas << suica
    items = []
    items << Item.new(name: 'コーラ', price: 120, stock: 5, id: 1)
    items << Item.new(name: 'レッドブル', price: 200, stock: 5, id: 2)
    items << Item.new(name: '水', price: 100, stock: 5, id: 3)
    history = []
    vend = Vend.new(items: items, sales: 0, history: history)
    user_now = users[0]
    suica_now = suicas[0]
    count = 0
    item = items[0]
    refute suica_now.pay(item)
  end

  def test_suica_no_stock
    users = []
    suicas = []
    user = User.new(age: 28, gender: '男性')
    suica = Suica.new(money: 1000, user: user)
    users << user
    suicas << suica
    items = []
    items << Item.new(name: 'コーラ', price: 120, stock: 0, id: 1)
    items << Item.new(name: 'レッドブル', price: 200, stock: 5, id: 2)
    items << Item.new(name: '水', price: 100, stock: 5, id: 3)
    history = []
    vend = Vend.new(items: items, sales: 0, history: history)
    user_now = users[0]
    suica_now = suicas[0]
    count = 0
    item = items[0]
    refute vend.request(item)
  end
end
