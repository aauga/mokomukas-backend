# frozen_string_literal: true

RSpec.describe UserLessonsController, type: :controller do
  let(:user) { create(:user) }
  let(:lesson) { create(:lesson) }
  let!(:user_lesson) { create(:user_lesson, user:, lesson:) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  shared_examples 'when successful request' do
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the created user_lesson as json' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['id']).to eq(user_lesson.id)
    end
  end

  describe 'GET #index' do
    context 'when user_lesson exists' do
      before do
        get :index, params: { lesson_id: lesson.id }
      end

      it_behaves_like 'when successful request'
    end

    context 'when user_lesson does not exist' do
      before do
        get :index, params: { lesson_id: 'non-existent' }
      end

      it 'returns http not_found' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST #create' do
    context 'when creation is successful' do
      before do
        allow(UserLessons::Create).to receive(:run).and_return(user_lesson)
        post :create, params: { user_lesson: { lesson_id: lesson.id } }
      end

      it_behaves_like 'when successful request'
    end
  end
end
