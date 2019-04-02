class CreateArtWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :art_works do |t|
      t.string :title
      t.string :image_url
      t.integer :artist_id

      t.timestamps
    end
    add_index :art_works, :artist_id
  end
end
