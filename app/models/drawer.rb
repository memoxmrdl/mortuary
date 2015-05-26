class Drawer < ActiveRecord::Base
  has_many :boxes

  validates :name, presence: true, uniqueness: true
end
