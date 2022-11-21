class AddMemotoTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :memo, :string
  end
end
