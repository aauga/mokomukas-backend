# frozen_string_literal: true

RSpec.describe UserTasks::CreateBatch do
  subject { described_class.run(user_lesson) }

  let(:user_lesson) { create(:user_lesson) }
  let(:task_count) { user_lesson.lesson.tasks.count }

  it 'creates user tasks for each task in the lesson' do
    expect { subject }.to change { UserTask.count }.by(2)
  end

  it 'logs the creation of each user task' do
    expect(Rails.logger).to receive(:info)
      .with(/User task created for/)
      .exactly(task_count)
      .times

    subject
  end
end
