class TypesController < ApplicationController
  load_and_authorize_resource
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  def index
    self.params = params.permit!
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
        format.html { redirect_to @type, notice: 'Type was successfully created.' }
        format.json { render :show, status: :created, location: @type }
      else
        format.html { render :new }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @type.update(type_params)
        format.js
        format.html { redirect_to @type, notice: 'Type was successfully updated.' }
        format.json { render :show, status: :ok, location: @type }
      else
        format.html { render :edit }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @type.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to type_path, notice: 'Type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:name, :image, :user_id, :show_all, :page)
  end
end
