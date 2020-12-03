FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number:3) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 7, min_alpha:1, min_numeric: 1)}
    password_confirmation {password}
  end
end