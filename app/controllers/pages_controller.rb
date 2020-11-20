class PagesController < TypesController
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  def home
    @types = Type.where(:user_id => current_user.id)
  end
end
