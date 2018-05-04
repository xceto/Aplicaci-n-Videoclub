class User < ActiveRecord::Base
	validates :nombre, :email, presence: true
  has_many :arriendo, class_name: :id_usuario
end