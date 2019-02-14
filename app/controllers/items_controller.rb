# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, only: %i[show update destroy]

  def index
    json_response(@todo.items)
  end

  def show
    json_response(@item)
  end

  def create
    @item = @todo.items.create!(item_params)
    json_response(@item, :created)
  end

  def update
    @item.update!(item_params)
    json_response(@item)
  end

  def destroy
    @item.destroy!
    json_response(message: 'Deleted')
  end

  private

  def item_params
    params.permit(:title, :read)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_todo_item
    @item = @todo.items.find_by!(id: params[:id]) if @todo
  end
end
