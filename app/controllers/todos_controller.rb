# app/controllers/todos_controller.rb
class TodosController < ApplicationController
    def index
      @todos = Todo.all
    end
  
    def create
      @todo = Todo.new(todo_params)
      if @todo.save
        redirect_to root_path
      else
        render :index
      end
    end
  
    def update
      @todo = Todo.find(params[:id])
      if @todo.update(todo_params)
        redirect_to root_path
      else
        render :index
      end
    end
  
    private
  
    def todo_params
      params.require(:todo).permit(:title, :completed)
    end
  end