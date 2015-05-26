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
      redirect_to drawers_path
    else
      render :new
    end
  end

  private

  def drawer_params
    params.require(:drawer).permit(:name)
  end
end
