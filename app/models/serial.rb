class Serial < ActiveRecord::Base
	self.table_name = 'series'
	validates :titulo, :genero, :precio_arriendo, :temporada, presence: true
	has_many :Arriendo, foreign_key: :entidad_id
end