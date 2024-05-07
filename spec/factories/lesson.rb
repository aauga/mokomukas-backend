# frozen_string_literal: true

FactoryBot.define do
  factory :lesson do
    name { 'Dienos užduotis' }
    description { 'Dienos užduotis lala' }

    tasks do
      [
        create(:task, template_id: 'template_1'),
        create(:task, template_id: 'template_2')
      ]
    end
  end
end
