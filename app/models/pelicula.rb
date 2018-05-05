class Pelicula < ActiveRecord::Base
	validates :titulo, :genero, :precio_arriendo, :duracion, presence: true
  has_many :Arriendo, foreign_key: :entidad_id

	ransacker :precio_arriendo do
	  Arel.sql("to_char(\"#{table_name}\".\"precio_arriendo\", '999999999999999')")
	end

	ransacker :duracion do
	  Arel.sql("to_char(\"#{table_name}\".\"duracion\", '99999999999999')")
	end
end
