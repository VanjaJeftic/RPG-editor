module TypesHelper
  def type_avatar(type)
    image = type.image
    if image.attached?
      image_type = image_tag(image)
    end
    image_type
  end
end
