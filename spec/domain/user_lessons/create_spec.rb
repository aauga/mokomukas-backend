# frozen_string_literal: true

RSpec.describe UserLessons::Create do
  subject { described_class.run(user, params) }

  let!(:user) { create(:user) }
  let!(:lesson) { create(:lesson) }
  let(:params) { { lesson_id: lesson.id } }

  it 'creates a user lesson' do
    expect { subject }.to change { UserLesson.count }.by(1)
  end

  it 'returns the created user lesson' do
    expect(subject).to be_a(UserLesson)
    expect(subject.user).to eq(user)
    expect(subject.lesson).to eq(lesson)
  end
end
