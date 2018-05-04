class PeliculasController < ApplicationController

	def index
    @q = Pelicula.ransack(params[:q])
		@peliculas= @q.result(distinct: true)
	end

	def lista
		@pelis= Pelicula.all
		render :json => @pelis
	end

	def new
		@pelicula= Pelicula.new
	end

  def create
    
    @errors = []
    @errors << "X Titulo no puede estar vacio" unless params[:pelicula][:titulo].present?
    @errors << "X Genero no puede estar vacio" unless params[:pelicula][:genero].present?
    @errors << "X Precio Arriendo no puede estar vacio" unless params[:pelicula][:precio_arriendo].present?
    @errors << "X Duración no puede estar vacio" unless params[:pelicula][:duracion].present?

    if @errors.present?
      flash[:alert] = @errors
      redirect_to :back
    else    
      @peliculas= Pelicula.new(user_params)
      if @peliculas.save
        @errors = ["Se creo correctamente"]
        flash[:notice] = @errors
        redirect_to :back
      else
        @errors = ["Problemas al guardar la pelicula"]
        flash[:alert] = @errors
        redirect_to :back       
      end
    end 
  end

	def edit
		@pelicula= Pelicula.find(params[:id])
	end

  def update
    @pelicula= Pelicula.find(params[:id])
    if @pelicula.update_attributes(user_params)
      flash[:notice] = 'Se guardo correctamente'
      redirect_to :back
    else
      flash[:alert] = 'Problemas con guardar'
      redirect_to :back
    end  
  end

  def destroy
    Pelicula.find(params[:id]).destroy
    flash[:notice] = 'Pelicula Eliminada'
    redirect_to :back
  end

  private

  def user_params
    params.require(:pelicula).permit(:titulo, :genero, :precio_arriendo, :duracion)
  end
end