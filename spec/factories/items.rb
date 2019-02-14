# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    title { Faker::Lorem.word }
    read { false }
  end
end
