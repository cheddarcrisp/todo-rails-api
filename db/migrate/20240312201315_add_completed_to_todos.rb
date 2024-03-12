class AddCompletedToTodos < ActiveRecord::Migration[7.1]
  def change
    add_column :todos, :completed, :boolean, default: false
  end
end
