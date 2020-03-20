class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :image_id
      t.date :date
      t.string :camera
      t.string :lens
      t.string :aperture
      t.string :ss
      t.string :iso
      t.string :wb
      t.string :focus
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
