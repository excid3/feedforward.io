class Podcast < ActiveRecord::Base
  belongs_to :link
  has_attached_file :audio

  attr_accessible :name, :audio, :link_id, :description, :duration

  validates_presence_of :name, :description, :duration
  validates :audio, :attachment_presence => true
end
