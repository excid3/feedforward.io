class Link < ActiveRecord::Base
  attr_accessible :title, :url
  belongs_to :user
  validates :title, :url, presence: true
end
