# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    subject "MyString"
    name "MyString"
    email "MyString"
    department "MyString"
    issue "MyText"
    reference "MyString"
    status "MyString"
    user nil
  end
end
