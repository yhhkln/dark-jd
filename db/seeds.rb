if User.find_by(email: "admin@test.com").nil?
  u = User.new
  u.email = "admin@test.com"           # 可以改成自己的 email
  u.password = "111111"                # 最少要六码
  u.password_confirmation = "111111"   # 最少要六码
  u.is_admin = true
  u.is_dadmin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end
if User.find_by(email: "122380981@qq.com").nil?
  u = User.new
  u.email = "122380981@qq.com"           # 可以改成自己的 email
  u.password = "111111"                # 最少要六码
  u.password_confirmation = "111111"   # 最少要六码
  u.is_admin = true
  u.is_dadmin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end
Category.create(name: "厨")
Category.create(name: "肉")
Category.create(name: "菜")
Category.create(name: "料")
Product.create!(title: "猪瘦肉片500g",
price: rand(25..30),
quantity: 50,
 )
puts "21"
# Product.create!(title: "猪腿弧肉500g",
# price: rand(25..30),
# quantity: 50,
#  )
# puts "22"
# Product.create!(title: "猪小里脊500g",
# price: rand(25..30),
# quantity: 50,
#  )
# puts "23"
# Product.create!(title: "颈前排段500g",
# price: rand(25..30),
# quantity: 50,
#  )
# puts "24"
# Product.create!(title: "肉馅500g",
# price: rand(25..30),
# quantity: 50,
#  )
# puts "25"
# Product.create!(title: "猪寸骨500g",
# price: rand(25..30),
# quantity: 50,
#  )
# puts "26"
# Product.create!(title: "猪肋排500g",
# price: rand(25..30),
# quantity: 50,
#  )
# puts "27"
# Product.create!(title: "肉青500g",
# price: rand(25..30),
# quantity: 50,
#  )
# puts "28"
# Product.create!(title: "菜心",
# price: rand(10..15),
# quantity: 50,
# )
# puts "31"
# Product.create!(title: "菜心",
# price: rand(10..15),
# quantity: 50,
# )
# puts "32"
# Product.create!(title: "皇宫菜",
# price: rand(10..15),
# quantity: 50,
# )
# puts "33"
# Product.create!(title: "芥蓝",
# price: rand(10..15),
# quantity: 50,
# )
# puts "34"
# Product.create!(title: "空心菜",
# price: rand(10..15),
# quantity: 50,
# )
# puts "35"
# Product.create!(title: "青江菜",
# price: rand(10..15),
# quantity: 50,
# )
# puts "36"
# Product.create!(title: "意大利生菜",
# price: rand(10..15),
# quantity: 50,
# )
# puts "37"
# Product.create!(title: "圆椒",
# price: rand(10..15),
# quantity: 50,
# )
# puts "38"
# Product.create!(title: "盐",
# price: 1,
# quantity: 50,
# )
# puts "41"
# Product.create!(title: "胡椒粉",
# price: 1,
# quantity: 50,
# )
# puts "42"
# Product.create!(title: "孜然",
# price: 1,
# quantity: 50,
# )
# puts "43"
# Product.create!(title: "肉桂",
# price: 1,
# quantity: 50,
# )
# puts "44"
# Product.create!(title: "辣椒粉",
# price: 1,
# quantity: 50,
# )
# puts "45"
# Product.create!(title: "黑胡椒",
# price: 1,
# quantity: 50,
# )
# puts "46"
# Product.create!(title: "混合香料1",
# price: 1,
# quantity: 50,
# )
# puts "47"
# Product.create!(title: "混合香料2",
# price: 1,
# quantity: 50,
# )
# puts "48"
# Product.create!(title: "三星主厨",
# price: 499,
# quantity: 50,
# # category_id: 1,
# )
# puts "11"
# Product.create!(title: "两星主厨",
# price: rand(90..100)*10,
# quantity: 50,
# )
# puts "12"
# Product.create!(title: "两星主厨",
# price: rand(90..100)*10,
# quantity: 50,
#  )
# puts "13"
# Product.create!(title: "两星主厨",
# price: rand(90..100)*10,
# quantity: 50,
#  )
# puts "14"
# Product.create!(title: "两星主厨",
# price: rand(90..100)*10,
# quantity: 50,
#  )
# puts "15"
# Product.create!(title: "一星主厨",
# price: rand(90..100)*10,
# quantity: 50,
#  )
# puts "16"
# Product.create!(title: "一星主厨",
# price: rand(90..100)*10,
# quantity: 50,
#  )
# puts "17"
# Product.create!(title: "一星主厨",
# price: rand(90..100)*10,
# quantity: 50,
#  )
# puts "18"
