class AddDateToSubtask < ActiveRecord::Migration[5.0]
  def change
    add_column :subtasks, :subtask_date, :datetime
    add_column :subtasks, :subtask_hour, :string
  end
end
