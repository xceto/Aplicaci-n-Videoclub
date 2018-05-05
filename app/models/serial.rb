class Serial < ActiveRecord::Base
	self.table_name = 'series'
	validates :titulo, :genero, :precio_arriendo, :temporada, presence: true
	has_many :Arriendo, foreign_key: :entidad_id

	ransacker :precio_arriendo do
	  Arel.sql("to_char(\"#{table_name}\".\"precio_arriendo\", '999999999999999')")
	end

	ransacker :temporada do
	  Arel.sql("to_char(\"#{table_name}\".\"temporada\", '99999999999999')")
	end
end