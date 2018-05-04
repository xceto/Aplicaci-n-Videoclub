class Arriendo < ActiveRecord::Base
	belongs_to :Pelicula
	belongs_to :Serial, foreign_key: :entidad_id
	belongs_to :User, foreign_key: :id_usuario
end