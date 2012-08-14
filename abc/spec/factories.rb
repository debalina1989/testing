FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    firstname "Joseph"
    lastname "Ninja"

    factory :admin do
      admin true
    end
  end

  factory :post do
    content "Lorem ipsum"
    user
  end

end
