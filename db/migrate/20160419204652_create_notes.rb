class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :username
      t.text :message

      t.timestamps null: false
    end
  end
end
