class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.integer :type
      t.integer :status

      t.timestamps
    end
  end
end
