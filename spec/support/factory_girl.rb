require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :nicole, class: User do
    email 'nfelch121394@gmail.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :post do
    sequence(:subject) { |n| "Cool Post #{n}" }
    content "Awesome!"
  end

  factory :post_with_emoji, class: Post do
    subject "Hey :smile:"
    content "What's up :question:"
  end

  factory :comment do
    content "Real cool!"
    user
    post
  end

  factory :comment_with_emoji, class: Comment do
    content "Real cool! :sunglasses:"
    user
    post
  end
end
