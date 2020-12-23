class TypesController < ApplicationController
  load_and_authorize_resource except: [:show]
  respond_to :js, :html

  def index
    @types = @types.order('created_at DESC').page(params[:page]).per(4)

    @types = Type.all.order('created_at DESC').page(params[:page]).per(4) if params[:show_all] == 'true'
  end

  def show
    @type = Type.find(params[:id])
  end

  def create
    @type = current_user.types.new(type_params)
    saved = @type.save
    render :new unless saved
  end

  def update
    updated = @type.update(type_params)
    render :edit unless updated
  end

  def destroy
    @type.destroy
  end

  private

  def type_params
    params.require(:type).permit(:name, :image)
  end
end
