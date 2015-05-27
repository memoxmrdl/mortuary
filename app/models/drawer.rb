class Drawer < ActiveRecord::Base
  include Slugged

  before_create :generate_slug

  has_many :boxes, dependent: :delete_all

  validates :name, presence: true, uniqueness: true
end
