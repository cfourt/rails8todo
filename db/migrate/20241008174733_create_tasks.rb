class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :details

      t.boolean :completed
      t.datetime :completed_at

      t.datetime :due_date
      t.boolean :past_due

      t.timestamps
    end
  end
end
