FactoryBot.define do
  factory :athlete do
    name { "MyString" }
    age { 1 }
    collegiate_athlete { false }
    gym { nil }
  end
end
