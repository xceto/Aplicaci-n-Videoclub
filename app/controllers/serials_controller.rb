class SerialsController < ApplicationController
	def index
    @q = Serial.ransack(params[:q])
		@series= @q.result(distinct: true)
	end

	def new
		@serie= Serial.new
	end

	def lista
		@series_tv= Serial.all
		render :json => @series_tv
	end

	def new
		@serie= Serial.new
	end

  def create

    @errors = []
    @errors << "X Titulo no puede estar vacio" unless params[:serial][:titulo].present?
    @errors << "X Genero no puede estar vacio" unless params[:serial][:genero].present?
    @errors << "X Precio Arriendo no puede estar vacio" unless params[:serial][:precio_arriendo].present?
    @errors << "X Numero de Temporadas no puede estar vacio" unless params[:serial][:temporada].present?    

    if @errors.present?
      flash[:alert] = @errors
      redirect_to :back
    else
      @series= Serial.new(user_params)
      if @series.save
        flash[:notice] = 'Se creo correctamente'
        redirect_to :back
      else
        flash[:alert] = 'Problemas al guardar la Seria'
        redirect_to :back       
      end
    end
  end

	def edit
		@serie= Serial.find(params[:id])
	end

  def update
    @series= Serial.find(params[:id])
    if @series.update_attributes(user_params)
      flash[:notice] = 'Se guardo correctamente'
      redirect_to :back
    else
      flash[:alert] = 'Problemas con guardar'
      redirect_to :back
    end  
  end

  def destroy
    Serial.find(params[:id]).destroy
    flash[:notice] = 'Serie Eliminada'
    redirect_to :back
  end

  private

  def user_params
    params.require(:serial).permit(:titulo, :genero, :precio_arriendo, :temporada)
  end

end