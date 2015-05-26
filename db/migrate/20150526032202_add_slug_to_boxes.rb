class AddSlugToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :slug, :string, null: false
  end
end
