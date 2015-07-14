FactoryGirl.define do
  factory :user do
    email('user@user.com')
    password('password')
    role('admin')
  end

  factory :question do
    option_a('eat cat poop')
    option_b('eat dog poop')
  end
end
