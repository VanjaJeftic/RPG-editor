class TypesController < ApplicationController
  before_action :authenticate_user!
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
    render :new if @type.save != true
  end

  def update
    render :edit if @type.update(type_params_update) != true
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

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path, notice: 'Please Sign In or Sign Up to view that page!'
    end
  end
end
