FactoryBot.define do
  factory :kimono do
    kimono_name_id  { 2 }
    kimono_genre_id { 3 }
    tpo_id          { 4 }
    color_pattern   { "半身桜柄、藤色" }
    season          { "春、秋" }
    material_id     { 2 }
    wore_date       { "2020/12/23"} 
    cleaned_date    { "2019/04/09" }
    memo            { "臈纈染め" }
    association :user
  end
end
