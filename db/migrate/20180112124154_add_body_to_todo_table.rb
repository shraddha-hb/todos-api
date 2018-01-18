class AddBodyToTodoTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :todos, :body, :text
  end
end
