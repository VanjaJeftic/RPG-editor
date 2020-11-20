module AttributesHelper
  def attribute_avatar(attribute)
    @icon = attribute.icon
    if @icon.attached?
      @icon_attribute = image_tag (@icon)
    else
      @icon_attribute = image_tag("icon_default.jpeg")
    end
    return @icon_attribute
  end
end
