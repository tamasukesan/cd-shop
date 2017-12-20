# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8
  User.create(:email => "d@d", :first_name => "佐藤", :last_name => "たま", :first_name_kana => "さとう" , :last_name_kana => "たま", :post_code => "000-0000", :address => "東京都練馬区", :password => '111111')
  User.create(:email => "g@g", :first_name => "佐藤", :last_name => "たま", :first_name_kana => "さとう" , :last_name_kana => "たま", :post_code => "000-0000", :address => "東京都練馬区", :password => '222222')

5.times do |no|
    Item.create(:adminster_id => "#{no}", :artist_name => "アーティスト #{no}", :album_name => "タイトル #{no}", :cd_image_id => "画像 #{no}", :price => "１０００#{no}" ,:label_name => "レーベル#{no}" ,:genre => "ジャンル#{no}" ,:luanch_date => "発売#{no}" , :artist_name_kana => "かな#{no}", :editor => "編集者#{no}", :stock => "在庫#{no}", :item_status => "ステータス#{no}" )
end
Adminster.create(:email => 'sample@com', :password => 'aaaaaaaa')


5.times do |no|
     Item.create(
         :adminster_id => 1,
         :album_name => "テスト #{no}",
         :artist_name => "アーティスト #{no}",
         :price => "1000",
         :cd_image_id => open "/db/migrate/sample.jpg",
         )
 end

