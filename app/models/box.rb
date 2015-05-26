class Box < ActiveRecord::Base
  include Slugged
  before_create :generate_slug

  belongs_to :drawer

  validates :name, :birth, :death, :drawer_id, presence: true
end
