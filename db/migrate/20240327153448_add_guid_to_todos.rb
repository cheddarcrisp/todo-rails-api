class AddGuidToTodos < ActiveRecord::Migration[7.1]
  def change
    add_column :todos, :guid, :string
  end
end
