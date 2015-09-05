class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link, counter_cache: true

  validates :user_id, uniqueness: {scope: :link_id}
end
