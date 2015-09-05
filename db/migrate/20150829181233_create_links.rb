class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id
      t.string :title
      t.string :link_type
      t.string :url
      t.text :description
      t.string :image
      t.integer :votes_count, default: 0, null: false

      t.timestamps null: false
    end
  end
end
