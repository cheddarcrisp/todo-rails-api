class TodosController < ApplicationController
  # GET /todos
  def index
    @todos = Todo.all

    render json: TodosService.get_all
  end

  # GET /todos/1
  def show
    render json: TodosService.get(id: params[:id])
  end

  # POST /todos
  def create
    todo = Todo.create(todo_params)
    render json: todo, status: :created, location: todo
  end

  # PATCH/PUT /todos/1
  def update
    render json: TodosService.update(
      id: params[:id],
      title: todo_params[:title],
      completed: todo_params[:completed],
      order: todo_params[:order])
  end

  # DELETE /todos/1
  def destroy
    TodosService.delete(id: params[:id])
  end

  def destroy_all
    TodosService.delete_all
  end

  private
    def todo_params
      params.require(:todo).permit(:title, :completed, :order)
    end
end
