class TypesController < ApplicationController
  load_and_authorize_resource
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  def index
    @types = current_user.types.order('created_at DESC').page(params[:page]).per(4)

    @types = if params[:show_all] == 'true'
               Type.all.order('created_at DESC').page(params[:page]).per(4)
             else
               current_user.types.order('created_at DESC').page(params[:page]).per(4)
             end

    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    respond_to do |format|
      format.js
    end
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
    respond_to do |format|
      if @type.save
        format.js
      else
        render :index
      end
    end
  end

  def update
    respond_to do |format|
      if @type.update(type_params_update)
        format.js
      else
        render :index
      end
    end
  end

  def destroy
    @type.destroy
    respond_to do |format|
      format.js
    end
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