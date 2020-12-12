module AttributesHelper
  def attribute_avatar(attribute)
    icon = attribute.icon
    icon_attribute = image_tag(icon) if icon.attached?
    icon_attribute
  end
end
