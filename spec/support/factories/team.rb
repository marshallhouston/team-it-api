FactoryBot.define do
  factory :team do
    name { Faker::Name.unique.name }
    team_code { Faker::Number.unique.number(5) }
  end
end
