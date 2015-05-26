class Box < ActiveRecord::Base
  include Slugged
  before_create :generate_slug

  belongs_to :drawer
  has_attached_file :photo, styles: { thumb: '600x600#', medium: '300x300#', small: '160x160#' }
  has_attached_file :video

  validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  validates_attachment_content_type :video, content_type: ['video/mp4', 'video/mov', 'video/mpeg', 'video/mpeg4', 'video/x-flv']

  validates :name, :birth, :death, :drawer_id, presence: true
end
