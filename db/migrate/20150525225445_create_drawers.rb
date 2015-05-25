class CreateDrawers < ActiveRecord::Migration
  def change
    create_table :drawers do |t|

      t.timestamps null: false
    end
  end
end
