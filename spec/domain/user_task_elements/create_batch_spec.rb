# frozen_string_literal: true

RSpec.describe UserTaskElements::CreateBatch do
  subject { described_class.run(user_task) }

  let(:user_task) { create(:user_task) }
  let(:task) { user_task.task }
  let!(:task_element) { create(:task_element, task:) }

  it 'creates user task elements' do
    expect { subject }.to change { UserTaskElement.count }.by(1)
  end
end
