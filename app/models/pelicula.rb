class Pelicula < ActiveRecord::Base
	validates :titulo, :genero, :precio_arriendo, :duracion, presence: true
  has_many :Arriendo, foreign_key: :entidad_id
end
