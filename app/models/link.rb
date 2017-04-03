class Link < ApplicationRecord
  include OpenGraphable

  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :users

  scope :sorted, ->{ order(created_at: :desc) }

  validates :url, presence: true

  def voted_by?(user)
    return false if user.nil?
    votes.where(user_id: user.id).any?
  end
end
