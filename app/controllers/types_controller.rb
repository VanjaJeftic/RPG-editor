class TypesController < ApplicationController
  load_and_authorize_resource
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  def index
    self.params = params.permit!

    @types = Type.where(user_id: current_user).page(params[:page]).per(5)
    @types = if params[:show_all] == 'true'
               Type.all.page(params[:page]).per(5)
             else
               Type.where(user_id: current_user).page(params[:page]).per(5)
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
    type = Type.find(params[:id])
    if type.user_id != current_user.id
      respond_to do |format|
        format.js do
          render  template: 'types/update_failed.js.erb',
                  layout: false
        end
        format.json { head :no_content }
      end
    end
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
    if @type.user_id == current_user.id
      @type.destroy
        respond_to do |format|
          format.js
          format.html { redirect_to type_path, notice: 'Type was successfully destroyed.' }
          format.json { head :no_content }
        end
    else
      puts "dddddddddddddddddddddddddddddddddddddddd"
      respond_to do |format|
        format.js do
          render  template: 'types/delete_failed.js.erb',
                  layout: false
        end
        format.json { head :no_content }
      end
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
