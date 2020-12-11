class AttributesController < ApplicationController
  load_and_authorize_resource
  before_action :set_attribute, only: [:show, :edit, :update, :destroy]
  before_action :set_type, only: [:index, :new, :edit]

  def index
    @attributes = @type.attributes_association.order('created_at DESC').page(params[:page]).per(4)
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
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def create
    @attribute = Attribute.new(attribute_params)
    type = Type.find(@attribute.type_id)
    @attribute.user_id = type.user_id
    respond_to do |format|
      if @attribute.save
        format.js
      else
        render partial: 'attributes/index'
      end
    end
  end

  def update
    respond_to do |format|
      if @attribute.update(attribute_params_update)
        format.js
      else
        render partial: 'attributes/index'
      end
    end
  end

  def destroy
    @attribute.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def set_attribute
    @attribute = Attribute.find(params[:id])
  end

  def set_type
    @type = Type.find(params[:type_id])
  end

  def attribute_params
    params.require(:attribute).permit(:name, :numerical, :type_id, :icon)
  end

  def attribute_params_update
    params.require(:attribute).permit(:name, :numerical, :icon)
  end

end