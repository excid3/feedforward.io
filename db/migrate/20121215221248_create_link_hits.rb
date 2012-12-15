class CreateLinkHits < ActiveRecord::Migration
  def change
    create_table :link_hits do |t|
      t.string :linkable_type
      t.string :linkable_id
      t.integer :count

      t.timestamps
    end
  end
end
