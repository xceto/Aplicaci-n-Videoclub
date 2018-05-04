class ArriendosController < ApplicationController

	def index
    @usuarios= Arriendo.joins('RIGHT JOIN users ON arriendos.id_usuario = users.id').select("users.id, users.nombre, users.email,count(CASE WHEN arriendos.entidad_type = 'Pelicula' and arriendos.deleted_at is null then 1 ELSE NULL END)as peliculas,count(CASE WHEN arriendos.entidad_type = 'Serie' and arriendos.deleted_at is null then 1 ELSE NULL END) as series").group("users.id,users.nombre,users.email").pluck("users.id,users.nombre, users.email,count(CASE WHEN arriendos.entidad_type = 'Pelicula' and arriendos.deleted_at is null then 1 ELSE NULL END)as peliculas,count(CASE WHEN arriendos.entidad_type = 'Serie' and arriendos.deleted_at is null then 1 ELSE NULL END) as series")
	end

	def create
		#revisar validacion agregar con parametros
    redirect_to :back, notice: 'Debe contener un tipo de arriendo' unless params[:tipo_arriendo].present?
    redirect_to :back, notice: 'Debe contener una Pelicula/Serie' unless params[:opciones].present?
    entidad_type =
      if params[:tipo_arriendo].to_i == 1
        'Pelicula'
      elsif params[:tipo_arriendo].to_i == 2
        'Serie'
      end

    @nuevo_arriendo= Arriendo.new(id_usuario: params[:user_id], entidad_type: entidad_type, entidad_id: params[:opciones])
    if @nuevo_arriendo.save
      flash[:notice] = 'Se guardo correctamente'
    	redirect_to :back
    else	
      flash[:alert] = 'Problemas con guardar'
    	redirect_to :back
    end
	end

	def edit
	end

	def destroy
		destroy= Arriendo.update(params[:id], deleted_at: Time.now)
    validate_destroy= destroy.new_record?

    if validate_destroy == true
      flash[:alert] = 'Problemas al borrar el arriendo'
      redirect_to :back   
    elsif validate_destroy == false
      flash[:notice] = 'Se borro correctamente'
      redirect_to :back
    end
	end

end