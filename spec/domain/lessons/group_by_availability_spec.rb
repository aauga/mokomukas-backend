# frozen_string_literal: true

RSpec.describe Lessons::GroupByAvailability do
  subject { described_class.run(user) }

  let(:user) { create(:user) }
  let(:available_lesson) { create(:lesson) }
  let(:started_lesson) { create(:lesson) }
  let(:finished_lesson) { create(:lesson) }

  context 'when user is present' do
    before do
      create(:user_lesson, user:, lesson: started_lesson, status: 'started')
      create(:user_lesson, user:, lesson: finished_lesson, status: 'finished')
    end

    it 'groups lessons by availability' do
      expect(subject[:available]).to include(available_lesson)
      expect(subject[:started]).to include(started_lesson)
      expect(subject[:finished]).to include(finished_lesson)
    end
  end

  context 'when user is nil' do
    let(:user) { nil }

    it 'returns all lessons as available' do
      expect(subject[:available]).to include(available_lesson, started_lesson, finished_lesson)
    end
  end
end
