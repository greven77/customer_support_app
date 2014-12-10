# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "hosttastic#{n}@example.com" }
    sequence(:username) { |n| "user{n}"}
    password "password"
    password_confirmation "password"

    factory :admin_user do
      after(:create) do |user|
        user.confirm!
        user.update_attribute(:role, "admin")
      end
    end
  end
end
