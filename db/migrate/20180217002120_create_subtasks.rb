class CreateSubtasks < ActiveRecord::Migration[5.0]
  def change
    create_table :subtasks do |t|
      t.text :description
      t.references :task, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
