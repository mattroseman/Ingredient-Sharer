FactoryGirl.define do
  factory :user do
    email     "john.doe@gmail.com"
    username  "JohnDoe"
    location  "Home"
    is_admin  false
  end
  
  factory :post do
    trait :in_the_future do
      delete_at { 2.days.from_now }
    end

    trait :in_the_past do
      delete_at { 2.days.ago }
    end
  end
end
