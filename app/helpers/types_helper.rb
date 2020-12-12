module TypesHelper
  def type_avatar(type)
    image = type.image
    image_type = image_tag(image) if image.attached?
    image_type
  end
end
