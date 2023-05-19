class HomeController < ApplicationController
  def index
  end
  def about
  end

  def myslots
    @user = User.find(params[:id])
  end
end
