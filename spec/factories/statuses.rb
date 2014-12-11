# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status do
    description "Waiting for Staff Response"

    factory :status_on_hold do
      after(:create) do |status|
        status.update_attribute(:description, "On Hold")
      end
    end
    factory :status_waiting_for_customer do
      after(:create) do |status|
        status.update_attribute(:description, "Waiting for Customer")
      end
    end
    factory :status_cancelled do
      after(:create) do |status|
        status.update_attribute(:description, "Cancelled")
      end
    end
    factory :status_completed do
      after(:create) do |status|
        status.update_attribute(:description, "Completed")
      end
    end
  end
end