class UsrController < ApplicationController
  def index
    @cotacts = UsrContact.all # get all registerd contacts
  #  @fn = session[:firstname]
  end

  def register
  end
end
