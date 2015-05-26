class Drawer < ActiveRecord::Base
  include Slugged

  before_create :generate_slug

  has_many :boxes

  validates :name, presence: true, uniqueness: true
end
