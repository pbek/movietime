# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    name "MyString"
    rating 1.5
    votes 1
    length 1
    trailer_url "MyString"
    plot "MyText"
    plot_synopsis "MyText"
    plot_summary "MyText"
    poster_url "MyString"
    tagline "MyString"
    year 1
  end
end
