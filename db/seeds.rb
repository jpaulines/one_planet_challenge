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

Like.destroy_all
Answer.destroy_all
Post.destroy_all
ChallengeStep.destroy_all
Category.destroy_all
Challenge.destroy_all
CategoryReward.destroy_all
UsersReward.destroy_all
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

csv_text = Rails.root.join('lib', 'seeds', 'seeds-final.csv')

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
    content: row["step 4"],
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

POSTS = [
  ["Renewable Energy Challenge", "Hi, I took on this challenge and would love to switch to a renewable enegery provider. However, I am struggeling to find the right one. Does anyone have some experiences to share? Thank you!"],
  ["Local Farmers Market", "Hey Community! This Saturday there will be a lovely farmers market near Levinsky. I think it is really worth checking it out. Looking forward to seeing you there."],
  ["DIY Furniture repairs", "I commited to the DIY challenge, but noticed I don't have a huge talent with handling tools. Could someone give me some advice on how to fix a broken sofa leg? Appreciated!"],
  ["Terrasse Garden", "Shalom! I am lucky enough to have a roof top terasse and am planning to start a little vegetable and herb garden there. Would some of you maybe interested in starting this little sustainablity project with me?"],
  ["Plastic in the Oceans", "Dear Community, I was utterly shocked by this article (https://edition.cnn.com/2019/04/01/europe/sperm-whale-plastic-stomach-italy-scli-intl/index.html) and feel ever more encouraged to do good for our planet. I am so happy to have found like minded people here!"],
  ["Community Trade", "Hi Planetists! I took on the trading challenge and am hereby offering to exchange on of my renowned self made carrot cakes against a sun umbrella (needed for 2 days). Who's in?"],
  ["Fly less, smile more", "Guys, I just realised I have managed not to fly for 8 months straight. I am so proud and happy about this achievement. This community makes me grow!"],
  ["WWoofer Challenge", "Hello! Just wanted to share how much I loved my experience volunteering as WWoofer. I can only recommend this one of a kind challenge to anyone. It takes courage, but it's so worth it!!"],
  ["Made me laugh", "There is this invention called a bicycle that runs on fat and saves you money. :) So true, duh. Bikes for the win!!"],
  ["Little Morning Joke", "A climate scientist and a climate change denier walk into a bar. The denier says, nice to see you. The climate scientist says, nice to CO2." ],
  ["Flee Market this week", "Announcement: I am organizing a flee market in the Meir Park this weekend! Sort out beloved things you do not really need anymore and join me! (Great opportunity to earn some Greenpoints too ;)."],
  ["Match my greens!", "Hello Planetists! Not to brag, but I reached 150 greenpoints today woop woop!! I am challenging you to race me on this number ;) The first one to overtake me, will receive some of my homemade Kambucha."]
]






MALE_PHOTOS = [
"https://res.cloudinary.com/du6ced10c/image/upload/v1569311012/sample_user_avatars/m3_xny4uj.png",
"https://res.cloudinary.com/du6ced10c/image/upload/v1569311012/sample_user_avatars/m4_dhrcj2.png",
"https://res.cloudinary.com/du6ced10c/image/upload/v1569311011/sample_user_avatars/m1_zn32we.png",
"https://res.cloudinary.com/du6ced10c/image/upload/v1569311011/sample_user_avatars/m2_y738th.png"
]

FEMALE_PHOTOS = [
"https://res.cloudinary.com/du6ced10c/image/upload/v1569311012/sample_user_avatars/w2_gaq1m2.png",
"https://res.cloudinary.com/du6ced10c/image/upload/v1569311011/sample_user_avatars/w3_ejptzo.png",
"https://res.cloudinary.com/du6ced10c/image/upload/v1569311011/sample_user_avatars/w1_wfzwke.png",
"https://res.cloudinary.com/du6ced10c/image/upload/v1569311011/sample_user_avatars/w4_mki6y2.png",
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
  max_challenges: 1
  )

CategoryReward.create!(
  category: Category.find_by(name: "Shopping"),
  icon: "shopping-junior.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Junior Shopper",
  colour: "#46c190",
  min_challenges: 1,
  max_challenges: 5
  )

CategoryReward.create!(
  category: Category.find_by(name: "Shopping"),
  icon: "shopping-senior.svg",
  description: "Complete 9 challenges of the shopping category",
  name: "Senior Shopper",
  colour: "#676767",
  min_challenges: 5,
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
  description: "Complete 9 challenges of the mobility category",
  name: "Base Mobilizer",
  colour: "#C4C4C4",
  min_challenges: 0,
  max_challenges: 1
  )

CategoryReward.create!(
  category: Category.find_by(name: "Mobility"),
  icon: "mobility-junior.svg",
  description: "Complete 9 challenges of the mobility category",
  name: "Junior Mobilizer",
  colour: "#46c190",
  min_challenges: 1,
  max_challenges: 5
  )

CategoryReward.create!(
  category: Category.find_by(name: "Mobility"),
  icon: "mobility-senior.svg",
  description: "Complete 9 challenges of the mobility category",
  name: "Senior Mobilizer",
  colour: "#888888",
  min_challenges: 5,
  max_challenges: 9
  )


CategoryReward.create!(
  category: Category.find_by(name: "Mobility"),
  icon: "mobility-expert.svg",
  description: "Complete 9 challenges of the mobility category",
  name: "Expert Mobilizer",
  colour: "#BF9B30",
  min_challenges: 9,
  max_challenges: 100
  )


# Investment rewards

CategoryReward.create!(
  category: Category.find_by(name: "Investments"),
  icon: "investment-base.svg",
  description: "Complete 9 challenges of the investment category",
  name: "Base Investor",
  colour: "#C4C4C4",
  min_challenges: 0,
  max_challenges: 1
  )

CategoryReward.create!(
  category: Category.find_by(name: "Investments"),
  icon: "investment-junior.svg",
  description: "Complete 9 challenges of the investment category",
  name: "Junior Investor",
  colour: "#46c190",
  min_challenges: 1,
  max_challenges: 5
  )

CategoryReward.create!(
  category: Category.find_by(name: "Investments"),
  icon: "investment-senior.svg",
  description: "Complete 9 challenges of the investment category",
  name: "Senior Investor",
  colour: "#888888",
  min_challenges: 5,
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
  description: "Complete 9 challenges of the food category",
  name: "Base Foodie",
  colour: "#C4C4C4",
  min_challenges: 0,
  max_challenges: 1
  )

CategoryReward.create!(
  category: Category.find_by(name: "Food"),
  icon: "food-junior.svg",
  description: "Complete 9 challenges of the food category",
  name: "Junior Foodie",
  colour: "#46c190",
  min_challenges: 1,
  max_challenges: 5
  )

CategoryReward.create!(
  category: Category.find_by(name: "Food"),
  icon: "food-senior.svg",
  description: "Complete 9 challenges of the food category",
  name: "Senior Foodie",
  colour: "#888888",
  min_challenges: 5,
  max_challenges: 9
  )


CategoryReward.create!(
  category: Category.find_by(name: "Food"),
  icon: "food-expert.svg",
  description: "Complete 9 challenges of the food category",
  name: "Expert Foodie",
  colour: "#BF9B30",
  min_challenges: 9,
  max_challenges: 100
  )

# Home rewards

CategoryReward.create!(
  category: Category.find_by(name: "Home"),
  icon: "home-base.svg",
  description: "Complete 9 challenges of the home category",
  name: "Base Homie",
  colour: "#C4C4C4",
  min_challenges: 0,
  max_challenges: 1
  )

CategoryReward.create!(
  category: Category.find_by(name: "Home"),
  icon: "home-junior.svg",
  description: "Complete 9 challenges of the home category",
  name: "Junior Homie",
  colour: "#46c190",
  min_challenges: 1,
  max_challenges: 5
  )

CategoryReward.create!(
  category: Category.find_by(name: "Home"),
  icon: "home-senior.svg",
  description: "Complete 9 challenges of the home category",
  name: "Senior Homie",
  colour: "#888888",
  min_challenges: 5,
  max_challenges: 9
  )


CategoryReward.create!(
  category: Category.find_by(name: "Home"),
  icon: "home-expert.svg",
  description: "Complete 9 challenges of the home category",
  name: "Expert Homie",
  colour: "#BF9B30",
  min_challenges: 9,
  max_challenges: 100
  )


4.times do |i|
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
    remote_image_url: MALE_PHOTOS[i]
  )
  # CategoryReward.all.each do |reward|
  #   if reward.name.include?("Base")
  #     UsersReward.create!(user: u, category_reward: reward, shown: true)
  #   else
  #     UsersReward.create!(user: u, category_reward: reward)
  #   end
  # end
  post = POSTS.sample
  Post.create!(

    title: post[0],
    content: post[1],
    user: u,
  )
end

# Create female users


4.times do |i|
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
    remote_image_url: FEMALE_PHOTOS[i]
  )
  # CategoryReward.all.each do |reward|
  #   if reward.name.include?("Base")
  #     UsersReward.create!(user: u, category_reward: reward, shown: true)
  #   else
  #     UsersReward.create!(user: u, category_reward: reward)
  #   end
  # end
  post = POSTS.sample
  Post.create!(

    title: post[0],
    content: post[1],
    user: u,
  )
end

puts "Finished seeding!"

