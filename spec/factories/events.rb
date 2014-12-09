# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    reference "MyString"
    previous_status "MyString"
    current_status "MyString"
    issue "MyString"
  end
end
