class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references :user
      t.attachment :image
      t.string :name
      t.text :instructions

      t.timestamps
    end
    add_index :issues, :user_id
  end
end
