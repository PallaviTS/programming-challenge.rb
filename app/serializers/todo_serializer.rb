# frozen_string_literal: true

class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :read, :created_at, :updated_at
  has_many :items
end
