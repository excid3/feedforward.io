class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :name
      t.integer :link_id

      t.timestamps
    end
    add_attachment :podcasts, :audio
  end
end
