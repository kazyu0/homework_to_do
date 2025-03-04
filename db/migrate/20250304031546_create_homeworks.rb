class CreateHomeworks < ActiveRecord::Migration[7.1]
  def change
    create_table :homeworks do |t|
      t.string :title
      t.text :details
      t.date :deadline
      t.references :user, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
