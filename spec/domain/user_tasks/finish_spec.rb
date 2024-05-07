# frozen_string_literal: true

RSpec.describe UserTasks::Finish do
  subject { described_class.run(user, params) }

  let(:user) { create(:user) }
  let(:params) { { id: user_task.id } }
  let(:user_task) { create(:user_task, user_lesson: create(:user_lesson, user:)) }

  it 'finishes the task' do
    expect(subject.finished_at?).to eq(true)
  end

  context 'when task does not belong to user' do
    let(:other_user) { create(:user, username: 'other_user') }
    let(:user_task) { create(:user_task, user_lesson: create(:user_lesson, user: other_user)) }

    it 'raises error' do
      expect { subject }.to raise_error(Errors::ForbiddenAccess)
    end
  end

  context 'when task is already finished' do
    before { user_task.finish! }

    it 'raises error' do
      expect { subject }.to raise_error(Errors::TaskAlreadyFinished)
    end
  end
end
