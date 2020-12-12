class TypesController < ApplicationController
  load_and_authorize_resource
  before_action :set_type, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html

  def index
    @types = current_user.types.order('created_at DESC').page(params[:page]).per(4)

    @types = if params[:show_all] == 'true'
               Type.all.order('created_at DESC').page(params[:page]).per(4)
             else
               current_user.types.order('created_at DESC').page(params[:page]).per(4)
             end
  end

  def show
  end

  def new
    @type = Type.new
    @type.user_id = current_user.id
  end

  def edit
  end

  def create
    @type = Type.new(type_params)
    @type.user_id = current_user.id
    render :index if @type.save != true
  end

  def update
    render :index if @type.update(type_params_update) != true
  end

  def destroy
    @type.destroy
  end

  private

  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:name, :image, :user_id)
  end

  def type_params_update
    params.require(:type).permit(:name, :image)
  end
end
