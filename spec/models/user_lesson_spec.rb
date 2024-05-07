# frozen_string_literal: true

RSpec.describe UserLesson do
  let(:user) { create(:user) }
  let(:lesson) { create(:lesson) }
  let!(:user_lesson) { UserLesson.create!(user:, lesson:) }

  describe 'unique user and lesson pair' do
    context 'when user has not started the lesson yet' do
      it 'creates an entry in database' do
        expect(user_lesson).to be_persisted
      end
    end

    context 'when user has started the lesson' do
      let(:user_lesson_two) { UserLesson.create!(user:, lesson:) }

      it 'does not create an entry in the database' do
        expect { user_lesson_two }.to raise_error(
          ActiveRecord::RecordInvalid, /User has already been taken/)
      end
    end
  end

  describe 'status' do
    context 'when status is not provided' do
      it 'defaults to started' do
        expect(user_lesson.status).to eq('started')
      end
    end
  end
end
