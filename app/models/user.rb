class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :links
  has_many :votes

  validates :first_name, :last_name, presence: true

  def name; "#{first_name} #{last_name}"; end
  def short_name; "#{first_name} #{last_name.first}."; end
end
