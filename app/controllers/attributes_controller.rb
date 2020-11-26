class AttributesController < ApplicationController
  before_action :set_attribute, only: [:show, :edit, :update, :destroy]

  def index
    self.params = params.permit!
    type = Type.find(params[:type_id])
    @attribute_type_name = type.name
    @attribute_type_id = type.id

    @attributes = Attribute.where(type_id: params[:type_id]).page(params[:page]).per(5)

    respond_to do |format|
      format.js
    end
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def new
    @attribute = Attribute.new
    attribute = Type.find(params[:type_id])

    @attribute_type_id = attribute.id
    respond_to do |format|
      format.js
    end
  end

  def edit
    attribute = Type.find(params[:type_id])
    @attribute_type_id = attribute.id
  end

  def create
    attribute_params[:type_id] = params[:type_id]
    @attribute = Attribute.new(attribute_params)
    respond_to do |format|
      if @attribute.save
        format.js
        format.html { redirect_to @attribute, notice: 'Attribute was successfully created.' }
        format.json { render :show, status: :created, location: @attribute }
      else
        format.html { render :new }
        format.json { render json: @attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attribute.update(attribute_params)
        format.js
        format.html { redirect_to @attribute, notice: 'Attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @attribute }
      else
        format.html { render :edit }
        format.json { render json: @attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attribute.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to attributes_url, notice: 'Attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_attribute
    @attribute = Attribute.find(params[:id])
  end

  def attribute_params
    params.require(:attribute).permit(:name, :numerical, :value, :type_id, :icon)
  end
end
