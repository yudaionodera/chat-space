require "Faker"

FactoryGirl.define do
  pass = Faker::Internet.password(8)

  factory :user do
    name                      Faker::Name.name
    email                     Faker::Internet.email
    password                  pass
    password_confirmation     pass
    #group
    #after(:create) do |user| #なんだこれ。
    #create(:member, user: user, group: create(:group))
  end
end
