# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    user nil
    image "MyString"
    name "MyString"
    instructions "MyText"
  end
end
