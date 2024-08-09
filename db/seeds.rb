# db/seeds.rb

# Crear algunos usuarios
user1 = User.create!(
  name: "John Doe",
  username: "johndoe",
  email: "johndoe@example.com",
  password: "password123"
)

user2 = User.create!(
  name: "Jane Smith",
  username: "janesmith",
  email: "janesmith@example.com",
  password: "password123"
)

# Crear algunos contenidos
content1 = Content.create!(
  title: "Understanding Rails",
  description: "A comprehensive guide to Ruby on Rails.",
  category: "Tutorial",
  thumbnail_url: "http://example.com/rails_thumbnail.jpg",
  content_url: "http://example.com/rails_guide.pdf",
  author_id: user1.id
)

content2 = Content.create!(
  title: "Learning React",
  description: "An introduction to React for beginners.",
  category: "Tutorial",
  thumbnail_url: "http://example.com/react_thumbnail.jpg",
  content_url: "http://example.com/react_guide.pdf",
  author_id: user2.id
)

# Crear algunas calificaciones
Rating.create!(
  user_id: user1.id,
  content_id: content1.id,
  stars: 5
)

Rating.create!(
  user_id: user2.id,
  content_id: content1.id,
  stars: 4
)

Rating.create!(
  user_id: user1.id,
  content_id: content2.id,
  stars: 3
)

BlacklistedToken.create!(
  token: "invalid_jwt_token",
  expires_at: 2.days.from_now
)

puts "Data have charged succesfully."
