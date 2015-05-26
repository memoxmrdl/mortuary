class AddAttachmentPhotoToBoxes < ActiveRecord::Migration
  def self.up
    change_table :boxes do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :boxes, :photo
  end
end
