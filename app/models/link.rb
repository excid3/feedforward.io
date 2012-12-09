class Link < ActiveRecord::Base
  belongs_to :user
  has_one :podcast

  attr_accessible :title, :url, :podcast_attributes
  accepts_nested_attributes_for :podcast

  validates :title, :url, presence: true
end
