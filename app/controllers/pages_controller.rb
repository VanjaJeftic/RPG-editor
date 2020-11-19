class PagesController < TypesController
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  def home
    @types = Type.all
  end
end
