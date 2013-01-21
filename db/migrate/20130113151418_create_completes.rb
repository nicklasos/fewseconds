class CreateCompletes < ActiveRecord::Migration
  def change
    create_table :completes do |t|
      t.integer :user_id
      t.integer :issue_id

      t.timestamps
    end
  end
end
