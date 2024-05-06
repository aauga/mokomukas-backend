# frozen_string_literal: true

RSpec.describe User, type: :model do
  context 'when password is not present' do
    it 'is invalid' do
      user = User.new(username: 'johndoe')
      expect(user.valid?).to be false
    end
  end
end
