class Podcast < ActiveRecord::Base
  belongs_to :link
  has_attached_file :audio

  attr_accessible :name, :audio

  validates_presence_of :name
  validates :audio, :attachment_presence => true
end
