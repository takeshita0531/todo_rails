class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :content
      t.boolean :check
      t.string :mode
      t.date :duedate

      t.timestamps
    end
  end
end
