FactoryBot.define do

  factory :entry do
    title   {"title"}
    text    {"Hello"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end

end