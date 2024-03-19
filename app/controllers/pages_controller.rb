class PagesController < ApplicationController
  def home
    @channels = current_user.channels
  end
end
