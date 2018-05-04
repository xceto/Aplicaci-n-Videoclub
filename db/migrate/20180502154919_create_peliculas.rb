class CreatePeliculas < ActiveRecord::Migration
  def change
    create_table :peliculas do |t|
      t.string :titulo
      t.string :genero
      t.integer :precio_arriendo
      t.integer :duracion

      t.timestamps null: false
    end
  end
end
