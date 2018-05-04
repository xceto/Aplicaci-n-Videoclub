class UsersController < ApplicationController
	def index
		@usuarios = User.paginate(page: params[:page], per_page: 1)
	end

	def show
	end

  def new
    @usuario= User.new
    @arriendo= Arriendo.new
  end

  def create
    @errors = []
    @errors << "X Nombre no puede estar vacio" unless params[:user][:nombre].present?
    @errors << "X Email no puede estar vacio" unless params[:user][:email].present?
    if @errors.present?
      flash[:alert] = @errors
      redirect_to :back
    else
      @usuario= User.new(user_params)
      if @usuario.save
        @errors = ["Se guardo Correctamente"]
        flash[:notice] = @errors
        redirect_to :back
      else
        @errors = ["Problemas al crear al usuario"]
        flash[:alert] = @errors
        redirect_to :back       
      end      
    end
  end

  def edit
    @usuario= User.find(params[:id])
  end

  def update
    @usuario= User.find(params[:id])
    if @usuario.update_attributes(user_params)
      @errors = ["Se guardo correctamente"]
      flash[:notice] = @errors
      redirect_to :back
    else
      @errors = "Problemas con guardar"
      flash[:alert] = @errors
      redirect_to :back
    end  
  end

  def destroy
    User.find(params[:id]).destroy
    @errors = "Usuario Eliminado"
    flash[:notice] = @errors
    redirect_to :back
  end

	def arriendos
		@usuario= User.find(params[:user_id])
		@peliculas= Pelicula.joins(:Arriendo).where(arriendos: {id_usuario: params[:user_id], entidad_type: 'Pelicula', deleted_at: nil})
												.select('arriendos.id,peliculas.titulo,peliculas.genero,peliculas.precio_arriendo,peliculas.duracion as duracion, arriendos.entidad_type ')
		@series= Serial.joins(:Arriendo).where(arriendos: {id_usuario: params[:user_id], entidad_type: 'Serie', deleted_at: nil})
									.select('arriendos.id,series.titulo,series.genero,series.precio_arriendo,series.temporada as duracion, arriendos.entidad_type ')
		@arriendos=  @peliculas + @series		
	end

	def agrega_arriendo

	end

  private

  def user_params
    params.require(:user).permit(:nombre, :email)
  end

end