FactoryBot.define do
  factory :location do
    name Faker::Address.street_name
    external_id 'location-external-id'
    secret_code 'location-secret-code'
  end
end
