FactoryGirl.define do
  factory :item do
    name { Faker::StarWars.character }
    done true
    todo_id { Faker::Number.number(10) }
  end
end
