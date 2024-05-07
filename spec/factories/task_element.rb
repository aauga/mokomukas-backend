# frozen_string_literal: true

FactoryBot.define do
  factory :task_element do
    external_code { 'test_external_code' }
    correct

    trait :correct do
      correct { true }
    end

    trait :incorrect do
      correct { false }
    end
  end
end