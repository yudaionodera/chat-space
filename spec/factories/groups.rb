require "Faker"

FactoryGirl.define do
  factory :group do
    name         Faker::Name.name
    created_at   "2016-01-01T00:00:00Z"
    updated_at   "2016-01-01T00:00:00Z"
    #user
  end
end
