# frozen_string_literal: true

FactoryBot.define do
  factory :user_task do
    user_lesson { create(:user_lesson) }
    task { user_lesson.lesson.tasks.first }

    trait :finished do
      finished_at { Time.zone.now }
    end
  end
end
