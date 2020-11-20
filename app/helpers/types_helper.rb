module TypesHelper

  def type_avatar(type)
    @image = type.image
    if @image.attached?
      @image_type = image_tag (@image.url)
    else
      @image_type = image_tag("download.png")
    end
    return @image_type
  end

end
