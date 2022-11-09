require 'date'
require 'optparse'

opt = OptionParser.new
opt.on('-m') { |v| }
opt.parse!(ARGV)
num = ARGV.to_a

# 何も入力されていなければ今日の日付代入
if num.empty?
  time = Time.now
  num[0] = time.month
end

# 例外処理
begin
  a = Date.new(2022, num[0].to_i, 1)
rescue StandardError
  puts "#{num[0]} is neither a month number (1..12) nor a name"
  exit
end

# 月ごとの日数
month_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

# 1週目までの日数取得
day_first = 1..(7 - a.wday)

# ２週目までの日数取得
day_second = (7 - a.wday + 1)..(month_day[a.month - 1])

# 月と年を表示
print "      #{a.month}月 "
puts a.year

# 日から土までならべる
print '日 '
print '月 '
print '火 '
print '水 '
print '木 '
print '金 '
puts '土 '

# １日目まで行間調節する
a.wday.times { print '   ' }
# １週目を並べる
day_first.each do |n|
  print " #{n} "
end

# ２週目以降の改行
puts ' '

sum = 1
day_second.each do |n|
  if sum % 7 != 0
    sum += 1
    # 9以降の行間調整
    if n < 10
      print " #{n} "
    else
      print "#{n} "
    end
  else
    print "#{n}"
    puts ''
    sum += 1
  end
end

puts ''