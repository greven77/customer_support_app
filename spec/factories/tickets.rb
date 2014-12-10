# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    subject "MyString"
    name "MyString"
    email "xpto@xpto.com"
    department "MyString"
    issue "MyText"
    reference "MyString"
    status "MyString"
    email_confirmed true
    user nil
  end
end
