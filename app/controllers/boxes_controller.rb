class BoxesController < ApplicationController
  def new
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)

    if @box.save
      redirect_to drawers_path, notice: 'Nicho creado correctamente'
    else
      flash.now[:alert] = 'Nicho pudo ser creado correctamente'
      render :new
    end
  end

  private

  def box_params
    params.require(:box).permit(:name, :birth, :death, :semblance, :drawer_id)
  end
end
