require 'faker'

user=[]
puts "Creating users..."
20.times do
  user<<User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.unique.username,
    password: "password",
    password_confirmation: "password",
    role: [ 0, 1 ].sample
  )
end

course=[]
puts "Creating courses..."
10.times do
  course<<Course.create!(
    course_name: Faker::Educator.course_name,
    price: Faker::Commerce.price(range: 2500..15000)
  )
end

puts "Creating enrollments..."
50.times do
  Enrollment.create!(
    user_id:  user.sample,
    course_id: course.sample,
    status: [ 0, 1, 2, 3 ].sample
  )
end

puts "Seeding completed!"
