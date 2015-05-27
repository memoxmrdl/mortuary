class DrawersController < ApplicationController
  before_filter :find_drawer, only: [:show, :edit, :update, :destroy]

  def index
    @drawers = Drawer.all
  end

  def new
    @drawer = Drawer.new
  end

  def show
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
  end

  def update
    if @drawer.update_attributes(drawer_params)
      redirect_to drawers_path, notice: 'Gaveta actualizada correctamente'
    else
      flash.now[:alert] = 'Es vacio el campo'
      render :edit
    end
  end

  def destroy
    @drawer.destroy
    redirect_to drawers_path, notice: 'Gaveta eliminada correctamente'
  end

  private

  def find_drawer
    @drawer = Drawer.find_by_slug(params[:id])

    unless @drawer
      redirect_to drawers_path, alert: 'No se encontro ninguna gaveta'
    end
  end

  def drawer_params
    params.require(:drawer).permit(:name)
  end
end
