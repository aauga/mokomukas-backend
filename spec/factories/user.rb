# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'john' }
    password { 'doe' }
  end
end
