class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about_us ]
  def home
    @rooms = Room.order(created_at: :desc).limit(3)
  end

  def about_us
  end
end
