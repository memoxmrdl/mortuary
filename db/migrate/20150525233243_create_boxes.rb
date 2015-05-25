class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :name, null: false
      t.date :birth, null: false
      t.date :death, null: false
      t.text :semblance

      t.belongs_to :drawer, index: true

      t.timestamps null: false
    end
  end
end
