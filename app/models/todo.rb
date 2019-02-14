# frozen_string_literal: true

class Todo < ApplicationRecord
  has_many :items, dependent: :destroy
  validates_presence_of :title

  after_update_commit :set_items_read_flag

  def set_items_read_flag
    items.update_all(read: read)
  end
end
