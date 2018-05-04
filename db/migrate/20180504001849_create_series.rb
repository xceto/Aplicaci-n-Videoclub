class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :titulo
      t.string :genero
      t.integer :precio_arriendo
      t.integer :temporada

      t.timestamps null: false
    end
  end
end
