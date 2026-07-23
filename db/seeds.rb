require 'faker'
require 'open-uri'

# fetch 5 bg images, as the loremflickr seems to be pretty severely rate limited
puts "Fetching background images..."
background_images = 5.times.map do |i|
  io = URI.parse(Faker::LoremFlickr.image).open
  { io: StringIO.new(io.read), filename: "background-#{i}.jpg", content_type: "image/jpeg" }
end
puts "Done."

# Create 10 users
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    profile_attributes: {
      username: Faker::Internet.user_name,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
    }
  )

  # Each user creates 1-10 blogs
  rand(1..10).times do
    blog = user.blogs.create!(
      name: Faker::Book.title,
      description: Faker::Lorem.paragraph,
      visibility: :visible,
      user: user
    )

    img = background_images.sample
    blog.background.attach(io: StringIO.new(img[:io].string), filename: img[:filename], content_type: img[:content_type])

    # Each blog has 5-10 posts
    rand(5..10).times do
      blog.posts.create!(
        title: Faker::Book.title,
        body: Faker::Lorem.paragraphs(number: 5, supplemental: true).join("\n\n"),
        user: user,
      )
    end
  end
end
# user=User.create
# blog = user.blogs.create
#
# user2=User.create
# blog.add_coauthor(user2)
