# app/controllers/todos_controller.rb
class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = current_user.todos
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to root_path
    else
      render :index
    end
  end

  def update
    @todo = current_user.todos.find(params[:id])
    if @todo.update(todo_params)
      redirect_to root_path
    else
      render :index
    end
  end

  # def destroy
  #   @todo = current_user.todos.find(params[:id])
  #   # 以下省略
  # end

  private

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end