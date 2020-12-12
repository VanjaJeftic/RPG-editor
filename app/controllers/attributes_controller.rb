class AttributesController < ApplicationController
  load_and_authorize_resource
  before_action :set_type
  before_action :set_attribute, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html

  def index
    @attributes = @type.attributes_association.order('created_at DESC').page(params[:page]).per(4)
  end

  def show
  end

  def new
    @attribute = Attribute.new
  end

  def edit
  end

  def create
    @attribute = Attribute.new(attribute_params)
    @attribute.user_id = @type.user_id
    render partial: 'attributes/index' if @attribute.save != true
  end

  def update
    render partial: 'attributes/index' if @attribute.update(attribute_params_update) != true
  end

  def destroy
    @attribute.destroy
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
    params.require(:attribute).permit(:name, :numerical, :icon, :type_id)
  end
end
