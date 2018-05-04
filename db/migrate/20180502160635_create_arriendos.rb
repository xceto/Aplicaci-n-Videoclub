class CreateArriendos < ActiveRecord::Migration
  def change
    create_table :arriendos do |t|
      t.integer :id_usuario
      t.string :entidad_type
      t.integer :entidad_id

      t.timestamps null: false
    end
  end
end
