class DrawersController < ApplicationController
  def index
    @drawers = Drawer.all
  end

  def new
    @drawer = Drawer.new
  end

  def create
    @drawer = Drawer.new(drawer_params)

    if @drawer.save
      redirect_to drawers_path, notice: 'Gaveta creada correctamente'
    else
      flash.now[:alert] = 'Ya existe una gaveta con ese nombre o es vacio el campo'
      render :new
    end
  end

  def edit
    @drawer = Drawer.find_by_slug(params[:id])
  end

  def update
    @drawer = Drawer.find_by_slug(params[:id])

    if @drawer.update_attributes(drawer_params)
      redirect_to drawers_path, notice: 'Gaveta actualizada correctamente'
    else
      flash.now[:alert] = 'Es vacio el campo'
      render :edit
    end
  end

  def destroy
    @drawer = Drawer.find_by_slug(params[:id])

    if @drawer.destroy
      redirect_to drawers_path, notice: 'Gaveta eliminada correctamente'
    else
      redirect_to drawers_path, alert: 'No se encontro ninguna gaveta'
    end
  end

  private

  def drawer_params
    params.require(:drawer).permit(:name)
  end
end
