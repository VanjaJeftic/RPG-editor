class TypesController < ApplicationController
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  # GET /types
  # GET /types.json
  def index
    #@types = Type.where(:user_id => current_user.id)
    @types = Type.all
  end

  # GET /types/1
  # GET /types/1.json
  def show

  end

  # GET /types/new
  def new
    @type = Type.new
    @type.user_id = current_user.id
  end

  # GET /types/1/edit
  def edit
  end

  # POST /types
  # POST /types.json
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

  # PATCH/PUT /types/1
  # PATCH/PUT /types/1.json
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

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @user_id = @type.user_id

    if current_user.id == @user_id
      puts "ttttttttttttttessssssssssssssssssssssss"
      @type.destroy
      respond_to do |format|
        format.js
        format.html { redirect_to type_path, notice: 'Type was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
      puts " tuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"
      #flash.now[:error] = "Your book was not found"
      flash.now[:error] = "Invalid name/password combination"
      puts "ovdeeeeeeeeeeeeeeeeeee"
      format.html { redirect_to types_path}
      puts "heooooooooooooooooooooo"
      #flash.now[:alert] = "Type cannot be deleted by user who didn't create it."e
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_params
      params.require(:type).permit(:name, :image, :user_id)
    end
end
