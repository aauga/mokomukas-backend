# frozen_string_literal: true

RSpec.describe UserTasks::CreateBatch do
  subject { described_class.run(user_lesson) }

  let(:user_lesson) { create(:user_lesson) }
  let(:task_count) { user_lesson.lesson.tasks.count }

  it 'creates user tasks for each task in the lesson' do
    expect { subject }.to change { UserTask.count }.by(2)
  end
end
