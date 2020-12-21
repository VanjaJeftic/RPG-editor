class AttributesController < ApplicationController
  load_and_authorize_resource except: [:index]
  before_action :set_type
  respond_to :js, :html

  def index
    @attributes = @type.character_attributes.order('created_at DESC').page(params[:page]).per(4)
  end

  def create
    @attribute = @type.character_attributes.new(attribute_params)
    saved = @attribute.save
    render :new unless saved
  end

  def update
    updated = @attribute.update(attribute_params_update)
    render :edit unless updated
  end

  def destroy
    @attribute.destroy
  end

  private

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
