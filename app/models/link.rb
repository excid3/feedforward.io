class Link < ActiveRecord::Base
  belongs_to :user
  has_many :votes, counter_cache: true
  has_many :users

  scope :sorted, ->{ order(created_at: :desc) }

  before_validation :set_values

  def set_values
    og = OpenGraph.new(url)
    self.title ||= og.title # => "Open Graph protocol"
    self.link_type ||= og.type || "Article" # => "website"
    self.description ||= og.description # => "The Open Graph protocol enables any web page to become a rich object in a social graph."
    self.image ||= og.images.first
  end

  def voted_by?(user)
    return false if user.nil?
    votes.where(user_id: user.id).any?
  end
end
