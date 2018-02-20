FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.free_email("#{name}") }
  end
end
