# frozen_string_literal: true

RSpec.describe UserTasksController, type: :controller do
  let(:user) { create(:user) }
  let(:user_lesson) { create(:user_lesson, user:) }
  let(:user_task) { create(:user_task, user_lesson:) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'POST #finish' do
    before do
      allow(UserTasks::Finish).to receive(:run).and_return(user_task)
      post :finish, params: { id: user_task.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    context 'when interactor raises an error' do
      before do
        allow(UserTasks::Finish).to receive(:run).and_raise(Errors::TaskAlreadyFinished)
        post :finish, params: { id: user_task.id }
      end

      it 'returns bad request' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
