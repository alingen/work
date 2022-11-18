group = [
  ['A', rand(1..6)],
  ['B', rand(1..6)],
  ['C', rand(1..6)],
  ['D', rand(1..6)],
  ['E', rand(1..6)],
  ['F', rand(1..6)]
]
group_a = []
group_b = []

# 要素の数グループ分けをする
group.each do |group|
  # 偶数か奇数かでグループわける
  if group[1].even?
    # group_aは３つまで要素を入れられる
    if group_a.length < 3
      group_a.push(group[0])
    else
      group_b.push(group[0])
    end
  elsif group_b.length < 4
    # group_bは４つまで要素をいれられる
    group_b.push(group[0])
  else
    group_a.push(group[0])
  end
end

print group_a
print group_b
