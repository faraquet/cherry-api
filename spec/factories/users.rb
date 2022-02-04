# frozen_string_literal: true

FactoryBot.define do
  sequence(:email) { |n| "user-#{n}@test.com" }

  factory :user do
    email { generate(:email) }
    password { '123456789' }
  end
end
