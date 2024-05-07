# frozen_string_literal: true

RSpec.describe UserTask do
  let(:user_lesson) { create(:user_lesson) }
  let(:lesson) { user_lesson.lesson }
  let(:task) { lesson.tasks.first! }

  describe 'unique user_lesson, task pair' do
    let!(:user_task) { UserTask.create!(user_lesson:, task:) }

    context 'when user has not started the task yet' do
      it 'creates an entry in database' do
        expect(user_task).to be_persisted
      end
    end

    context 'when user has started the task already' do
      let(:user_task_two) { UserTask.create!(user_lesson:, task:) }

      it 'does not create an entry in the database' do
        expect { user_task_two }.to raise_error(
          ActiveRecord::RecordInvalid, /User lesson has already been taken/
        )
      end
    end
  end

  describe '#task_belongs_to_lesson' do
    let(:user_task) { UserTask.create!(user_lesson:, task:) }

    context 'when task belongs to lesson' do
      it 'does not add any errors' do
        expect { user_task }.not_to raise_error
      end
    end

    context 'when task does not belong to lesson' do
      let(:task) { create(:task, lessons: [create(:lesson)]) }

      it 'adds an error' do
        expect { user_task }.to raise_error(ActiveRecord::RecordInvalid, /Task does not belong to lesson/)
      end
    end
  end
end
