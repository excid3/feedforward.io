class AddPodcastToLinks < ActiveRecord::Migration
  def self.up
    add_attachment :links, :podcast
  end

  def self.down
    remove_attachment :links, :podcast
  end
end
