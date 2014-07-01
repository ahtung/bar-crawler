FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
    paths { FactoryGirl.create_list(:path, 5) }
  end
end