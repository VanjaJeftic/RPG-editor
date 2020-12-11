module AttributesHelper
  def attribute_avatar(attribute)
    icon = attribute.icon
    if icon.attached?
      icon_attribute = image_tag(icon)
    end
    icon_attribute
  end
end