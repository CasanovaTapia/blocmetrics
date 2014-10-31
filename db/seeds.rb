require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.save!
end
users = User.all

# Create Page Visits
100.times do
  @user = users.sample
  Event.create!(
    name: "page_visit",
    location: "http://localhost:3000",
    property_1: 1,
    property_2: @user.email,
    ip_address: Faker::Internet.ip_v4_address,
    user_key: @user.unique_key,
    created_at: Faker::Time.between(300.days.ago, Time.now)
  )
end
events = Event.all

# Create admin user
admin = User.new(
  name:     "Admin User",
  email:    "admin@example.com",
  password: "helloworld"
  )
admin.save!


puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Event.count} events created"
