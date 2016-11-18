FactoryGirl.define do
  factory :user do
    email     "john.doe@gmail.com"
    username  "JohnDoe"
    location  "Home"
    is_admin  false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email     "admin@isa.app"
    username  "admin"
    location  "adminHome"
    is_admin  true
  end
end
