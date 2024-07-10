require 'faker'

# Create 60 users
60.times do
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
      user: user
    )

    blog.background.attach(io: URI.parse(Faker::LoremFlickr.image).open, filename: 'background')

    # Each blog has 5-10 posts
    rand(5..10).times do
      blog.posts.create!(
        title: Faker::Book.title,
        body: Faker::Lorem.paragraphs(number: 5),
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