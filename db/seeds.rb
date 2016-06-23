10.times do
    User.create!(email: Faker::Internet.email('Nancy'), password: "123456", password_confirmation: "123456")
end

users = User.all

100.times do
    Item.create!(name: Faker::Name.name, user: users.sample)
end


puts "Seed finished"
puts "#{Item.count} items created"
puts "#{User.count} users created"

