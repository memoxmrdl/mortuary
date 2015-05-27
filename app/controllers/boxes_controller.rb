class BoxesController < ApplicationController
  def new
    @box = Box.new
  end

  def show
    @box = Box.find_by_slug(params[:id])
  end

  def create
    @box = Box.new(box_params)

    if @box.save
      redirect_to drawers_path, notice: 'Nicho creado correctamente'
    else
      flash.now[:alert] = 'Nicho pudo ser creado'
      render :new
    end
  end

  def edit
    @box = Box.find_by_slug(params[:id])
  end

  def update
    @box = Box.find_by_slug(params[:id])

    if @box.update_attributes(box_params)
      redirect_to drawer_box_path(@box.drawer, @box), notice: 'Nicho actualizado correctamente'
    else
      flash.now[:alert] = 'Nicho pudo ser actualizado'
      render :edit
    end
  end

  def destroy
    @box = Box.find_by_slug(params[:id])

    if @box.destroy
      redirect_to drawers_path, notice: 'Nicho eliminado correctamente'
    else
      redirect_to drawers_path, alert: 'No se encontro ningun nicho'
    end
  end

  private

  def box_params
    params.require(:box).permit(:name,
                                :birth,
                                :death,
                                :semblance,
                                :drawer_id,
                                :photo,
                                :video)
  end
end
