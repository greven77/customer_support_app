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
    status "MyString"
    email_confirmed true
    user nil
  end
end
