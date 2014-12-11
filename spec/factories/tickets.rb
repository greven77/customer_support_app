# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    subject "MyString"
    name "MyString"
    sequence(:email) { |n| "xpto#{n}@xpto.com" }
    department "MyString"
    issue "Lorem ipsum dolor sit amet, consectetur adipisicing elit. " +
        "Minus eum autem doloremque similique nulla fugit totam excepturi," +
        " architecto consectetur ex, ea nam dolor praesentium possimus" +
        " quisquam culpa fuga quam laboriosam."
    sequence(:reference) { |n| "HLG-6C-VOR-1C-JO#{n}"}
    status "Waiting for Staff Response"
    email_confirmed true
    user nil
    factory :ticket_on_hold do
      after(:create) do |ticket|
        ticket.update_attribute(:status, "On Hold")
      end
    end
    factory :ticket_waiting_for_customer do
      after(:create) do |ticket|
        ticket.update_attribute(:status, "Waiting for Customer")
      end
    end
    factory :ticket_cancelled do
      after(:create) do |ticket|
        ticket.update_attribute(:status, "Cancelled")
      end
    end
    factory :ticket_completed do
      after(:create) do |ticket|
        ticket.update_attribute(:status, "Completed")
      end
    end
  end
end