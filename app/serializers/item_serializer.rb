class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :read, :created_at, :updated_at
end
