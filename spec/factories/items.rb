FactoryBot.define do
  factory :item do
    item_name_id   { 2 }
    tpo_id        { 4 }
    color_pattern { "半身桜柄、藤色" }
    season        { "春、秋" }
    material_id   { 2 }
    wore_date     { "2020/12/23"} 
    cleaned_date  { "2019/04/09" }
    memo          { "臈纈染め" }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end