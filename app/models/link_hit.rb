class LinkHit < ActiveRecord::Base
  attr_accessible :count, :linkable_type, :linkable_id
  belongs_to :linkable, polymorphic: true
end
