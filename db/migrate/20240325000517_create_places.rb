class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :xid
      t.string :name
      t.integer :rate
      t.string :osm
      t.string :wikidata
      t.string :kinds
      t.string :coordinates

      t.timestamps
    end
  end
end
