Friendship.destroy_all
UserWeight.destroy_all
User.destroy_all


def seed_users
  15.times do
    nu = User.new
    nu.first_name = Faker::Name.first_name
    nu.last_name =  Faker::Name.last_name
    nu.email = "#{nu.first_name}#{nu.last_name}@example.com"
    nu.password = "password"
    nu.password_confirmation = "password"
    nu.save
  end
end

def seed_user_weights
  users = User.all

  users.each do |user|
    20.times do
      UserWeight.create!(
        user_id: user.id,
        weight: Faker::Number.within(range: 50.0..200.0)
      )
    end
  end
end

def seed_friendships
  users = User.all

  users.each do |user|
    5.times do
      friend = User.find(rand(1..14))
      Friendship.create!(
        user_id: user.id,
        friend_id: friend.id
      )
    end
  end
end

seed_users
seed_user_weights
seed_friendships
