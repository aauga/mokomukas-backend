# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    template_id { 'test_template' }

    after(:create) do |task|
      create(:task_element, :correct, task:)
      create(:task_element, :incorrect, task:)
      create(:task_element, :correct, task:)

      create(:lesson, name: 'Lesson 1', tasks: [task])
      create(:lesson, name: 'Lesson 2', tasks: [task])
    end
  end
end
