# frozen_string_literal: true

FactoryBot.define do
  factory :user_task_element do
    user_task
    task_element

    clicked { false }
    clicked_correctly { false }

    trait :clicked_correctly do
      clicked { true }
      clicked_correctly { true }
    end
  end
end
