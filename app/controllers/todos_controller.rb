# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :set_todo, only: %i[show update destroy]

  # GET /todos
  def index
    @todos = Todo.all
    json_response(@todos)
  end

  # POST /todos
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /todos/:id
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update!(todo_params)
    json_response(@todo)
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy!
    json_response(message: 'Deleted')
  end

  private

  def todo_params
    params.permit(:title, :read)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
