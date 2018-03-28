FactoryBot.define do
  factory :country do
    country_code Faker::Address.country_code
  end
end
