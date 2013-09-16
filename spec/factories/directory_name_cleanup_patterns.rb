# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :directory_name_cleanup_pattern do
    pattern "MyString"
    replace "MyString"
    priority 1
  end
end
