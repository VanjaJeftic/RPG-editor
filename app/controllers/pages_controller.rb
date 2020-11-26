class PagesController < ApplicationController
  def home
    @types = Type.all
  end
end
