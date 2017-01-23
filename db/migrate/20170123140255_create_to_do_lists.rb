class CreateToDoLists < ActiveRecord::Migration[5.0]
  def change
    create_table :to_do_lists do |t|
      t.references :user, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
