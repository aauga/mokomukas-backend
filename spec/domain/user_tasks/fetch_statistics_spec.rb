# frozen_string_literal: true

RSpec.describe UserTasks::FetchStatistics do
  subject { described_class.run(user_task) }

  let(:task) { create(:task) }
  let(:user_task) { create(:user_task, task:) }

  let(:task_element) { task.task_elements.first }
  let(:user_task_elements) { create(:user_task_element, :clicked_correctly, user_task:, task_element:) }

  it 'returns statistics' do
    expect(subject.total_elements).to eq(task_elements.count)
    expect(subject.correctly_clicked_elements).to eq(1)
    expect(subject.earned_money).to eq(UserAwards::MONEY)
    expect(subject.earned_experience_points).to eq(UserAwards::EXPERIENCE_POINTS)
  end
end
