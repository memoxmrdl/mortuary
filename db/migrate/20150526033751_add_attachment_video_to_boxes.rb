class AddAttachmentVideoToBoxes < ActiveRecord::Migration
  def self.up
    change_table :boxes do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :boxes, :video
  end
end
