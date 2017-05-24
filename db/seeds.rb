# Initialize Admin User
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
# Initialize Product
  f_title = [
    "北京烤鸭",
    "大闸蟹",
    "东坡肉",
    "剁椒鱼头",
    "法式鸡公煲",
    "宫保鸡丁",
    "锅包肉",
    "过桥米线",
    "煎饼果子",
    "麻辣香锅",
    "墨西哥肉卷",
    "三明治",
    "三文鱼扒 ",
    "水煮鱼",
    "小笼包",
    "红烧肉"
  ]
  f_images = [
    "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrq4hl3blj30rs0jqdjg.jpg",
    "http://ww2.sinaimg.cn/large/006tNbRwgy1ffrqa6g8lbj30i80r540z.jpg",
    "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrqaet2crj308c0693yt.jpg",
    "http://ww3.sinaimg.cn/large/006tNbRwgy1ffrqalyuc6j30dw09bgm7.jpg",
    "http://ww3.sinaimg.cn/large/006tNbRwgy1ffrqarbpb1j30dc06odgw.jpg",
    "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrqb1t147j30r80kfdkw.jpg",
    "http://ww2.sinaimg.cn/large/006tNbRwgy1ffrqb83ynaj30hs0a3diy.jpg",
    "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrqbeb3lgj30b408ctd5.jpg",
    "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrqbtofakj30c807sdgi.jpg",
    "http://ww3.sinaimg.cn/large/006tNbRwgy1ffrqceyovbj30m80etgx2.jpg",
    "http://ww1.sinaimg.cn/large/006tNbRwgy1ffrqcrtif5j30h40cu75f.jpg",
    "http://ww1.sinaimg.cn/large/006tNbRwgy1ffrqd72vprj30p00e2my3.jpg",
    "http://ww3.sinaimg.cn/large/006tNbRwgy1ffrqdgbtptj30ec09k42j.jpg",
    "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrqdo4poej30dw099wfq.jpg",
    "http://ww1.sinaimg.cn/large/006tNbRwgy1ffrqe008olj30le0c8q9k.jpg",
    "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrqbloodsj30p00gowj0.jpg"
  ]
  for i in 0..15 do
    Product.create!(
    title: f_title[i],
    description:"这只是底料，请去实验室DIY！",
    quantity:rand(6..10),
    price:rand(50..100)*10,
    # image: open(f_images[i])
    # product_id:[i],avatar:open(f_images[i])
    )
  end
  puts "1"
  # Photo.create!(product_id:1,avatar: open(f_images[0]))
  # Photo.create!(product_id:1,avatar: open(f_images[1]))
  # puts "2"
  for i in 0..15 do
    Photo.create!(product_id: (i+1) ,avatar:open(f_images [i]))
    # Photo.create!(product_id: (i+1) ,avatar:open(f_image2s [i]))
  end
puts "16份食物已经煮好了，就是不给你吃."
title = [
    "厨师汉尼拔",
    "法式一头五臂",
    "四岁熊孩子",
    "日式料理",
    "风油精",
    "跳跳糖",
    "芥末",
    "咖喱粉",
    "羊驼肉",
    "鲱鱼罐头",
    "鸵鸟肉",
    "牛肉",
    "罗马花椰菜",
    "紫土豆",
    "洋蓟",
    "",
  ]
  images = [
    "https://ws2.sinaimg.cn/large/006tNc79gy1ffws0503l1j31hc0xcdph.jpg",
    "https://ws3.sinaimg.cn/large/006tNc79gy1ffws2dd9c7j30go0dyaak.jpg",
    "https://ws3.sinaimg.cn/large/006tNc79gy1ffws2wyt4nj30bs0hsdgk.jpg",
    "https://ws4.sinaimg.cn/large/006tNc79gy1ffws1yxh4sj31kw11xqea.jpg",
    "https://ws4.sinaimg.cn/large/006tNc79gy1ffws6k85a8j30go09mglt.jpg",
    "https://ws3.sinaimg.cn/large/006tNc79gy1ffws6j1iafj308r08v3yz.jpg",
    "https://ws1.sinaimg.cn/large/006tNc79gy1ffws6jiak7j305u05u0st.jpg",
    "https://ws1.sinaimg.cn/large/006tNc79gy1ffws8vcmjgj31kw1kwx6q.jpg",
    "https://ws1.sinaimg.cn/large/006tNc79gy1ffwsa5ihgvj30ci08hq3z.jpg",
    "https://ws2.sinaimg.cn/large/006tNc79gy1ffwsaac943j30m80m2goa.jpg",
    "https://ws2.sinaimg.cn/large/006tNc79gy1ffwsa6gseuj30dw0flgmc.jpg",
    "https://ws1.sinaimg.cn/large/006tNc79gy1ffwsbewu1oj30q80imgog.jpg",
    "https://ws2.sinaimg.cn/large/006tNc79gy1ffwscgajevj31770stjuw.jpg",
    "https://ws4.sinaimg.cn/large/006tNc79gy1ffwsccs519j30go0ci0to.jpg",
    "https://ws3.sinaimg.cn/large/006tNc79gy1ffwscdncu0j307o053mx4.jpg",
    "https://ws1.sinaimg.cn/large/006tNc79gy1ffwsdg7rt0j30b408cgmp.jpg",
  ]
  for i in 0..15 do
    Dproduct.create!(
    title: title[i],
    quantity:rand(6..10),
    price:rand(50..100)*10,
    image: open(images[i])
    # product_id:[i],avatar:open(f_images[i])
    )
  end
  # Photo.create!(product_id:1,avatar: open(f_images[0]))
  # Photo.create!(product_id:1,avatar: open(f_images[1]))
  # puts "2"
  # for i in 0..15 do
  #   Photo.create!(product_id: (i+1) ,avatar:open(f_images [i]))
  #   # Photo.create!(product_id: (i+1) ,avatar:open(f_image2s [i]))
  # end
