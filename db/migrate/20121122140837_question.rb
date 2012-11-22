class Question < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :issue_id
      t.string :body

      t.timestamps
    end
    add_index :questions, :issue_id
  end
end
