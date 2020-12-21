class TypesController < ApplicationController
  load_and_authorize_resource except: [:show]
  before_action :set_type, only: [:show]
  respond_to :js, :html

  def index
    show_all_types = Type.all.order('created_at DESC').page(params[:page]).per(4)
    show_types_user_created = @types.order('created_at DESC').page(params[:page]).per(4)

    @types = params[:show_all] == 'true' ? show_all_types : show_types_user_created
  end

  def create
    @type = current_user.types.new(type_params)
    saved = @type.save
    render :new unless saved
  end

  def update
    updated = @type.update(type_params_update)
    render :edit unless updated
  end

  def destroy
    @type.destroy
  end

  private

  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:name, :image)
  end

  def type_params_update
    params.require(:type).permit(:name, :image)
  end
end
