class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :link_id

      t.timestamps null: false
    end

    add_index :votes, [:user_id, :link_id], unique: true
  end
end
