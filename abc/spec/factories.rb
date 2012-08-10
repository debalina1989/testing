FactoryGirl.define do
  factory :user do
    username "John"
    email "joseph@ex.com"
    password "foobar"
    password_confirmation "foobar"
    firstname "Joseph"
    lastname "Ninja"
  end
end
