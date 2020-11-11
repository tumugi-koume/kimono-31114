FactoryBot.define do
  factory :user do
    nickname              {"nono"}
    email                 {"mmm@gmail.com"}
    password              {"hhh123"}
    password_confirmation {password}
  end
end