# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Starting DB Seed"
puts "Seeding now..."

# Clear the DB


ChallengeStep.destroy_all
Challenge.destroy_all
CategoryReward.destroy_all
UsersReward.destroy_all
Category.destroy_all
User.destroy_all


CATEGORIES = [
  "Shopping",
  "Mobility",
  "Home",
  "Investments",
  "Food"
]

CATEGORIES.each do |category|
  Category.create(name: category)
end


require 'csv'

csv_text = Rails.root.join('lib', 'seeds', 'seeds3.csv')

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = csv_text

CSV.foreach(filepath, csv_options) do |row|
  cat = Category.find_by(name: row["Category"])
  challenge = Challenge.create!(
    name: row["Title"],
    content: row["Description"],
    time: row["Time (1-2-3)"].to_i,
    effort: row["Effort (1-2-3)"].to_i,
    money: row["Money (1-2-3)"].to_i,
    image: row["Image"],
    category: cat,
    greenpoint: row["Greenpoints"]
    )
  ChallengeStep.create!(
    content: row["Step 1"],
    challenge: challenge
    )
  ChallengeStep.create!(
    content: row["Step 2"],
    challenge: challenge
    )
  ChallengeStep.create!(
    content: row["Step 3"],
    challenge: challenge
    )
  ChallengeStep.create!(
    content: row["Step 4"],
    challenge: challenge
    )
end

# Constants to draw from

CHALLNGE_STEP_CONTENT = [
  "English",
  "French",
  "German",
  "Chinese",
  "Hebrew"
]

CHALLENGE_NAMES = [
  'Collect Beach Plastic',
  'Exchange Books',
  'Buy Second Hand Clothes',
  'Bring Reusable Straw',
  'Buy Local Food',
  'Bike To Go to Work',
  'Replace Soaps',
  'Switch to renewable energy',
  'Plan Local Holidays',
  'Plant Aromatic Plants',
  'Become Flexitarian',

]




MALE_PHOTOS = [
"https://res.cloudinary.com/dakarw0uq/image/upload/v1568286490/profile%20images/man1_bv0wqq.jpg",
"https://res.cloudinary.com/dakarw0uq/image/upload/v1568286490/profile%20images/man2_qfy3f9.jpg",
"https://res.cloudinary.com/dakarw0uq/image/upload/v1568286491/profile%20images/man3_gujgoz.jpg",
"https://res.cloudinary.com/dakarw0uq/image/upload/v1568286491/profile%20images/man4_sl4xjk.jpg",
"https://res.cloudinary.com/dakarw0uq/image/upload/v1568286491/profile%20images/man5_sta6ow.png"
]

FEMALE_PHOTOS = [
"https://res.cloudinary.com/dakarw0uq/image/upload/v1568286491/profile%20images/woman1_w1esnj.jpg",
"https://res.cloudinary.com/dakarw0uq/image/upload/v1568286491/profile%20images/woman2_ejfuq0.jpg",
"https://res.cloudinary.com/dakarw0uq/image/upload/v1568292986/profile%20images/asian_woman_epwkxv.jpg",
"https://res.cloudinary.com/dakarw0uq/image/upload/v1568286491/profile%20images/woman4_pq0zdm.jpg",
"https://res.cloudinary.com/dakarw0uq/image/upload/v1568286491/profile%20images/woman5_xxjnox.jpg"
]

# Create static list of event categories


# Create male users


# Shopping rewards

CategoryReward.create!(
  category: Category.find_by(name: "Shopping"),
  icon: "shopping-base.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Base Shopper",
  colour: "#C4C4C4",
  min_challenges: 0,
  max_challenges: 3
  )

CategoryReward.create!(
  category: Category.find_by(name: "Shopping"),
  icon: "shopping-junior.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Junior Shopper",
  colour: "#46c190",
  min_challenges: 3,
  max_challenges: 6
  )

CategoryReward.create!(
  category: Category.find_by(name: "Shopping"),
  icon: "shopping-senior.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Senior Shopper",
  colour: "#676767",
  min_challenges: 6,
  max_challenges: 9
  )

CategoryReward.create!(
  category: Category.find_by(name: "Shopping"),
  icon: "shopping-expert.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Expert Shopper",
  colour: "#BF9B30",
  min_challenges: 9,
  max_challenges: 100
  )

# Mobility rewards

CategoryReward.create!(
  category: Category.find_by(name: "Mobility"),
  icon: "mobility-base.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Base Mobilizer",
  colour: "#C4C4C4",
  min_challenges: 0,
  max_challenges: 3
  )

CategoryReward.create!(
  category: Category.find_by(name: "Mobility"),
  icon: "mobility-junior.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Junior Mobilizer",
  colour: "#46c190",
  min_challenges: 3,
  max_challenges: 6
  )

CategoryReward.create!(
  category: Category.find_by(name: "Mobility"),
  icon: "mobility-senior.svg",
  description: "Complete 9 challenges of the mobility category",
  name: "Senior Mobilizer",
  colour: "#888888",
  min_challenges: 6,
  max_challenges: 9
  )


CategoryReward.create!(
  category: Category.find_by(name: "Mobility"),
  icon: "mobility-expert.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Expert Mobilizer",
  colour: "#BF9B30",
  min_challenges: 9,
  max_challenges: 100
  )


# Investment rewards

CategoryReward.create!(
  category: Category.find_by(name: "Investments"),
  icon: "investment-base.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Base Investor",
  colour: "#C4C4C4",
  min_challenges: 0,
  max_challenges: 3
  )

CategoryReward.create!(
  category: Category.find_by(name: "Investments"),
  icon: "investment-junior.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Junior Investor",
  colour: "#46c190",
  min_challenges: 3,
  max_challenges: 6
  )

CategoryReward.create!(
  category: Category.find_by(name: "Investments"),
  icon: "investment-senior.svg",
  description: "Complete 9 challenges of the mobility category",
  name: "Senior Investor",
  colour: "#888888",
  min_challenges: 6,
  max_challenges: 9
  )


CategoryReward.create!(
  category: Category.find_by(name: "Investments"),
  icon: "investment-expert.svg",
  description: "Complete 9 challenges of the investment category",
  name: "Expert Investor",
  colour: "#BF9B30",
  min_challenges: 9,
  max_challenges: 100
  )

# Food rewards

CategoryReward.create!(
  category: Category.find_by(name: "Food"),
  icon: "food-base.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Base Foodie",
  colour: "#C4C4C4",
  min_challenges: 0,
  max_challenges: 3
  )

CategoryReward.create!(
  category: Category.find_by(name: "Food"),
  icon: "food-junior.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Junior Foodie",
  colour: "#46c190",
  min_challenges: 3,
  max_challenges: 6
  )

CategoryReward.create!(
  category: Category.find_by(name: "Food"),
  icon: "food-senior.svg",
  description: "Complete 9 challenges of the mobility category",
  name: "Senior Foodie",
  colour: "#888888",
  min_challenges: 6,
  max_challenges: 9
  )


CategoryReward.create!(
  category: Category.find_by(name: "Food"),
  icon: "food-expert.svg",
  description: "Complete 9 challenges of the investment category",
  name: "Expert Foodie",
  colour: "#BF9B30",
  min_challenges: 9,
  max_challenges: 100
  )

# Home rewards

CategoryReward.create!(
  category: Category.find_by(name: "Home"),
  icon: "home-base.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Base Homie",
  colour: "#C4C4C4",
  min_challenges: 0,
  max_challenges: 3
  )

CategoryReward.create!(
  category: Category.find_by(name: "Home"),
  icon: "home-junior.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Junior Homie",
  colour: "#46c190",
  min_challenges: 3,
  max_challenges: 6
  )

CategoryReward.create!(
  category: Category.find_by(name: "Home"),
  icon: "home-senior.svg",
  description: "Complete 9 challenges of the mobility category",
  name: "Senior Homie",
  colour: "#888888",
  min_challenges: 6,
  max_challenges: 9
  )


CategoryReward.create!(
  category: Category.find_by(name: "Home"),
  icon: "home-expert.svg",
  description: "Complete 9 challenges of the investment category",
  name: "Expert Homie",
  colour: "#BF9B30",
  min_challenges: 9,
  max_challenges: 100
  )
5.times do
u = User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.unique.username,
    password: '123456',
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    address: "Tel Aviv",
    time_level: rand(1..3),
    effort_level: rand(1..3),
    money_level: rand(1..3),
    greenpoint_score: rand(10..150),
    planet_country: rand(1..9),
    planet_user: rand(1..9),
    image: MALE_PHOTOS.sample
  )
  CategoryReward.all.each do |reward|
    if reward.name.include?("Base")
      UsersReward.create!(user: u, category_reward: reward, shown: true)
    else
      UsersReward.create!(user: u, category_reward: reward)
    end
  end
end

# Create female users

5.times do
  u = User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.unique.domain_word,
    password: '123456',
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    address: "Tel Aviv",
    time_level: rand(1..3),
    effort_level: rand(1..3),
    money_level: rand(1..3),
    greenpoint_score: rand(10..150),
    planet_country: rand(1..9),
    planet_user: rand(1..9),
    image: FEMALE_PHOTOS.sample
  )
  CategoryReward.all.each do |reward|
    if reward.name.include?("Base")
      UsersReward.create!(user: u, category_reward: reward, shown: true)
    else
      UsersReward.create!(user: u, category_reward: reward)
    end
  end
end

puts "Finished seeding!"

