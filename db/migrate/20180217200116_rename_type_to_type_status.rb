class RenameTypeToTypeStatus < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :type, :type_status
  end
end
