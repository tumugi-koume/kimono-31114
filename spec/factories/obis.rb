FactoryBot.define do
  factory :obi do
    obi_name_id     { Faker::Number.within(range: 2..11) }
    tpo_id          { Faker::Number.within(range: 2..6) }
    color_pattern   { Faker::Lorem.characters(number: 40) }
    season          { Faker::Lorem.characters(number: 40) }
    material_id     { Faker::Number.within(range: 2..7) }
    wore_date       { Faker::Date.between(from: '2020/01/01', to: '2021/12_31')} 
    cleaned_date    { Faker::Date.between(from: '2010/01/01', to: '2021/12/31')}
    memo            { Faker::Lorem.characters(number: 40) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
