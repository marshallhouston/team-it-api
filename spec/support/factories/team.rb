FactoryBot.define do
  factory :team do
    name { Faker::Name.unique.name }
    phone { Faker::PhoneNumber.phone_number }
  end
end
