module TypesHelper
  def type_avatar(type, size=40)
    if type.image.attached?
      type.image.variant(resize: "#{size}x#{size}!")
    end
  end
end
