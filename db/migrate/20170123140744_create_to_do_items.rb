class CreateToDoItems < ActiveRecord::Migration[5.0]
  def change
    create_table :to_do_items do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description
      t.integer :status
      t.references :to_do_list, foreign_key: true

      t.timestamps
    end
  end
end
