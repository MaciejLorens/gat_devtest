FactoryBot.define do
  factory :target_group do
    name Faker::App.name
    external_id Faker::Lorem.characters(10)
    parent_id Faker::Lorem.characters(10)
    secret_code Faker::Lorem.characters(10)
  end
end
