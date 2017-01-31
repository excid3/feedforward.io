require "administrate/base_dashboard"

class LinkDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    votes: Field::HasMany,
    users: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    link_type: Field::String,
    url: Field::String,
    description: Field::Text,
    image: Field::String,
    votes_count: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    view_count: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :votes,
    :users,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :votes,
    :users,
    :id,
    :title,
    :link_type,
    :url,
    :description,
    :image,
    :votes_count,
    :created_at,
    :updated_at,
    :view_count,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :votes,
    :users,
    :title,
    :link_type,
    :url,
    :description,
    :image,
    :votes_count,
    :view_count,
  ].freeze

  # Overwrite this method to customize how links are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(link)
  #   "Link ##{link.id}"
  # end
end
