# frozen_string_literal: true

FactoryBot.define do
  factory :user_lesson do
    user { create(:user) }
    lesson { create(:lesson) }
    started

    trait :started do
      status { :started }
      finished_at { nil }
    end

    trait :finished do
      status { :finished }
      finished_at { Time.zone.now }
    end
  end
end
