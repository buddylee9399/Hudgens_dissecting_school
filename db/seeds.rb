def create_site_admin
  1.times do |a|
    User.create(email: "site_admin1@ex.com",
                password: 'asdfasdf',
                password_confirmation: 'asdfasdf',
                first_name: "Site",
                last_name: "Admin")
  end

  puts "1 site admin created"
end


  
admin = User.create(email: "admin1@ex.com",
                password: 'asdfasdf',
                password_confirmation: 'asdfasdf',
                first_name: "Admin1",
                last_name: "User",
                role: "admin")

puts "1 admin created"  


def create_users
  50.times do |u|
    User.create(email: "user#{u+1}@ex.com",
                password: 'asdfasdf',
                password_confirmation: 'asdfasdf',
                first_name: "User#{u+1}",
                last_name: "User")
  end

  puts "#{User.count} users created"
end

# create_site_admin

create_users

10.times do
  Topic.create!(
    title: Faker::ProgrammingLanguage.unique.name
  )
end

puts "10 Topics created"

100.times do
  Guide.create!(
    title: Faker::ChuckNorris.fact.truncate(150),
    content: Faker::Books::Lovecraft.paragraphs,
    topic: Topic.all.sample,
    user: User.all.sample
  )
end

puts "100 guides created"



10.times do
  Guide.create!(
    title: Faker::ChuckNorris.fact.truncate(150),
    content: Faker::Books::Lovecraft.paragraphs,
    topic: Topic.all.sample,
    user: admin
  )
end

puts "Guides created for admin"

User.all.each do |user|
  if user.id != admin.id
    Following.create!(
      follower_id: user.id,
      followed_id: admin.id
    )
  end
end

puts "Followings created for admin"
