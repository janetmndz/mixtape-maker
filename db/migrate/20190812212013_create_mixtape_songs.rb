class CreateMixtapeSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :mixtape_songs do |t|
      t.belongs_to :mixtape, foreign_key: true
      t.belongs_to :song, foreign_key: true

      t.timestamps
    end
  end
end
