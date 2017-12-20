# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

