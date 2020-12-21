class TypesController < ApplicationController
  load_and_authorize_resource except: [:show]
  before_action :set_type, only: [:show]
  respond_to :js, :html

  def index
    @types = if params[:show_all] == 'true'
               Type.all.order('created_at DESC').page(params[:page]).per(4)
             else
               @types.order('created_at DESC').page(params[:page]).per(4)
             end
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
