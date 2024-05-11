# frozen_string_literal: true

FactoryBot.define do
  factory :task_element do
    task
    correct

    trait :correct do
      correct { true }
    end

    trait :incorrect do
      correct { false }
    end
  end
end