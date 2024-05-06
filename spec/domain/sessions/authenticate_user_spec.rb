# frozen_string_literal: true

RSpec.describe Sessions::AuthenticateUser do
  subject { described_class.run(params) }

  let(:user) { create(:user) }
  let(:password) { user.password }
  let(:params) { { username: user.username, password: } }

  context 'when authentication is successful' do
    it 'should return user' do
      expect(subject).to eq(user)
    end
  end

  context 'when password is incorrect' do
    let(:password) { 'wrong_password' }

    it { is_expected.to be_falsey }
  end
end
