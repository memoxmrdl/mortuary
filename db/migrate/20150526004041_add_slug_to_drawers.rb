class AddSlugToDrawers < ActiveRecord::Migration
  def change
    add_column :drawers, :slug, :string, null: false
  end
end
